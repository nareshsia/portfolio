import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/theme_switch.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemTap;
  final int currentIndex;

  const NavBar({
    super.key,
    required this.onItemTap,
    required this.currentIndex,
  });

  final List<String> navItems = const [
    'Home',
    'About',
    'Skills',
    'Service',
    'Projects',
    'Certificates',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color selectedColor = const Color(0xFF2563EB);
    final Color textColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    final Color hoverColor = isDark ? const Color(0xFFBFDBFE) : const Color(0xFF1D4ED8);

    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Naresh.dev",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: selectedColor,
            ),
          ),

          if (!isMobile)
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(navItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: NavBarItem(
                        label: navItems[index],
                        onTap: () => onItemTap(index),
                        textColor: textColor,
                        hoverColor: hoverColor,
                        isSelected: currentIndex == index,
                        selectedColor: selectedColor,
                      ),
                    );
                  }),
                ),
              ),
            )
          else
            PopupMenuButton<int>(
              icon: Icon(Icons.menu, color: textColor),
              onSelected: onItemTap,
              itemBuilder: (context) => List.generate(navItems.length, (index) {
                return PopupMenuItem<int>(
                  value: index,
                  child: Text(navItems[index]),
                );
              }),
            ),

          const ThemeSwitch(),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color textColor;
  final Color hoverColor;
  final bool isSelected;
  final Color selectedColor;

  const NavBarItem({
    super.key,
    required this.label,
    required this.onTap,
    required this.textColor,
    required this.hoverColor,
    required this.isSelected,
    required this.selectedColor,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: widget.isSelected
                ? widget.selectedColor
                : (_isHovered ? widget.hoverColor : widget.textColor),
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
