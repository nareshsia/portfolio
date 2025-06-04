import 'package:flutter/material.dart';
import 'package:portfolio/sections/about.dart';
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

  void scrollTo(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }

  final List<String> sectionTitles = [
    "Home",
    "About",
    "Skills",
    "Service",
    "Projects",
    "Contact",
  ];

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
                    : NavBar(onItemTap: scrollTo),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: sectionTitles.length,
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
                          return const ContactSection();
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
