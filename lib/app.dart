import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/certificates.dart';
import 'package:portfolio/sections/contact.dart';
import 'package:portfolio/sections/home.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/service.dart';
import 'package:portfolio/sections/skills.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:portfolio/widgets/nav_bar.dart';
import 'package:portfolio/widgets/theme_switch.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:provider/provider.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final ItemScrollController _scrollController = ItemScrollController();
  ValueNotifier currentIndex = ValueNotifier(0);

  void scrollTo(int index) {
    currentIndex.value = index;
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 300),
    );
  }

  final List<String> sectionTitles = [
    "Home",
    "About",
    "Skills",
    "Service",
    "Projects",
    'Certificates',
    "Contact",
  ];

  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();

    _positionsListener.itemPositions.addListener(() {
      final positions = _positionsListener.itemPositions.value;
      print("positions:${positions.toString()}");

      if (positions.isNotEmpty) {
        // Find the item whose top is closest to the top of the screen
        final visibleItems = positions.where((position) => position.itemLeadingEdge >= 0);
        if (visibleItems.isNotEmpty) {
          final topItem = visibleItems.reduce((min, pos) =>
          pos.itemLeadingEdge < min.itemLeadingEdge ? pos : min);

          if (topItem.index != currentIndex.value) {
            currentIndex.value = topItem.index;
          }
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naresh Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: Scaffold(
        drawer: Drawer(
          child: Builder(
            builder: (context) {
              return ListView(
                padding: EdgeInsets.zero,
                children: List.generate(sectionTitles.length, (index) {
                  return ListTile(
                    title: Text(sectionTitles[index]),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(index);
                    },
                  );
                }),
              );
            },
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            return Column(
              children: [
                isMobile
                    ? AppBar(
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        elevation: 0,
                        title: const Text("Portfolio"),
                        actions: const [ThemeSwitch()],
                        leading: Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            );
                          },
                        ),
                      )
                    : ValueListenableBuilder(
                        valueListenable: currentIndex,
                        builder: (context, value, child) {
                          return NavBar(
                            onItemTap: scrollTo,
                            currentIndex: value,
                          );
                        },
                      ),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: sectionTitles.length + 1,
                    itemPositionsListener: _positionsListener,// extra for footer
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const HomeSection();
                        case 1:
                          return const AboutSection();
                        case 2:
                          return const SkillsSection();
                        case 3:
                          return const ServiceSection();
                        case 4:
                          return const ProjectsSection();
                        case 5:
                          return const Certificates();
                        case 6:
                          return const ContactSection();
                        case 7:
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'Made with ❤️ by '),
                                    TextSpan(
                                      text: 'Naresh Prabhakar',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(text: ' • © 2025'),
                                  ],
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.color,
                                ),
                              ),
                            ),
                          );
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
