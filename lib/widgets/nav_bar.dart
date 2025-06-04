import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/theme_switch.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemTap;

  const NavBar({super.key, required this.onItemTap});

  final List<String> navItems = const [
    'Home',
    'About',
    'Skills',
    'Service',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color selectedColor = const Color(0xFF2563EB); // Primary
    final Color textColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280); // gray
    final Color hoverColor = isDark ? const Color(0xFFBFDBFE) : const Color(0xFF1D4ED8); // onHover

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
          Row(
            children: navItems
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: NavBarItem(
                  label: entry.value,
                  onTap: () => onItemTap(entry.key),
                  textColor: textColor,
                  hoverColor: hoverColor,
                ),
              ),
            )
                .toList(),
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

  const NavBarItem({
    super.key,
    required this.label,
    required this.onTap,
    required this.textColor,
    required this.hoverColor,
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
            color: _isHovered ? widget.hoverColor : widget.textColor,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
