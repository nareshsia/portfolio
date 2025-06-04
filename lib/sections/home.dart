import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isTablet = screenWidth >= 800 && screenWidth < 1100;

    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (isMobile || isTablet || constraints.maxWidth < 1100) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileImage(radius: isMobile ? 100 : 140),
                  const SizedBox(height: 24),
                  _buildTextContent(context, isMobile),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextContent(context, false),
                  const SizedBox(width: 100),
                  _buildProfileImage(radius: 180),
                ],
              );
            }
          },
        ),
      ),
    );
  }


  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I am",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : 28,
            fontWeight: FontWeight.w500,
            height: 1.0, // reduce internal vertical spacing
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 10),
        Text(
          "Nareshprabhakar 👋",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 32 : 56,
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 12),
        AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: GoogleFonts.poppins(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w600,
                color:  Theme.of(context).primaryColor,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'Android App Engineer',
              textStyle: GoogleFonts.poppins(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w600,
                color:  Theme.of(context).primaryColor,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'UI-focused Mobile Developer',
              textStyle: GoogleFonts.poppins(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w600,
                color:  Theme.of(context).primaryColor,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "Crafting clean, fast & scalable mobile apps using Flutter & Kotlin.",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 18,
            height: 1.5,
            color: Colors.grey[600],
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse("https://www.linkedin.com/in/nareshprabhakar"));
              },
              icon: SvgPicture.asset(
                "assets/linkedin_icon.svg",
                width: 30,
                height: 30,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse("https://github.com/nareshsia"));
              },
              icon:SvgPicture.asset(
                "assets/github_icon.svg",
                width: 30,
                height: 30,
                color: Theme.of(context).iconTheme.color,
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage({required double radius}) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("assets/profile.jpg"),
    );
  }

}
