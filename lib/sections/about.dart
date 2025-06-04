import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      child: Column(
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "About ",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                TextSpan(
                  text: "Me",
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

          const SizedBox(height: 24),
          Text(
            "Mobile developer with over 3 years of experience in building fast, reliable, and user-friendly applications.\n"
                "My journey began with native Android using Kotlin and Jetpack Compose, and later expanded into Flutter to build cross-platform apps with a single codebase. I focus on clean architecture, smooth user experiences, and scalable UI design.\n"
                "I enjoy solving real-world problems through mobile technology and take pride in writing code that’s both elegant and maintainable. In my free time, I explore new tools, experiment with minimal design, and build side projects that sharpen my skills.",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              height: 1.8,
              color: Colors.grey[700],

            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}
