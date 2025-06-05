import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "My ",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                TextSpan(
                  text: "Certificates",
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
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = isMobile ? constraints.maxWidth : constraints.maxWidth / 2 - 16;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildCertificateCard(context, "assets/certificates/bloc.jpg", itemWidth),
                  _buildCertificateCard(context, "assets/certificates/kotlin.jpg", itemWidth),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(BuildContext context, String path, double width) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
