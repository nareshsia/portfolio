import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Let’s ",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                TextSpan(
                  text: "Connect",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Have a project in mind, want to collaborate, or just say hi?",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).cardColor,
            child: Container(
              width: isMobile ? double.infinity : 500,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    "nareshprabhakar162@gmail.com",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/nareshprabhakar")),
                        icon: SvgPicture.asset(
                          "assets/linkedin_icon.svg",
                          width: 30,
                          height: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => launchUrl(Uri.parse("https://github.com/nareshsia")),
                        icon: SvgPicture.asset(
                          "assets/github_icon.svg",
                          width: 30,
                          height: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
