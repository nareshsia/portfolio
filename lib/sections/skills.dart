import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Map<String, String>> skillList = const [
    {"label": "Dart", "icon": "assets/skills/dart.svg"},
    {"label": "Flutter", "icon": "assets/skills/flutter.svg"},
    {"label": "Android", "icon": "assets/skills/android.svg"},
    {"label": "Jetpack Compose", "icon": "assets/skills/jetpackcompose.svg"},
    {"label": "Kotlin", "icon": "assets/skills/kotlin.svg"},
    {"label": "Firebase", "icon": "assets/skills/firebase.svg"},
    {"label": "SQL", "icon": "assets/skills/sql.svg"},
    {"label": "Figma", "icon": "assets/skills/figma.svg"},
    {"label": "Android Studio", "icon": "assets/skills/android_studio.svg"},
    {"label": "Postman", "icon": "assets/skills/postman.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Technical ",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                TextSpan(
                  text: "Skills",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor, // Primary color
                  ),
                ),
              ],
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 32),

          // Wrap layout for skills
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children: skillList.map((skill) {
              return SkillBox(iconPath: skill["icon"]!, label: skill["label"]!);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SkillBox extends StatefulWidget {
  final String iconPath;
  final String label;

  const SkillBox({super.key, required this.iconPath, required this.label});

  @override
  State<SkillBox> createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),

        child: Material(
          elevation: _isHovered ? 12 : 4,
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          child: Container(
            width: 200,
            height: 180,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(widget.iconPath, width: 90, height: 90),
                  const SizedBox(height: 8),
                  Text(
                    widget.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
