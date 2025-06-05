import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
                  text: "Projects",
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
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              ProjectCard(
                imagePath: 'assets/projects/savita.svg',
                title: 'Savita',
                tag: 'Crypto Exchange',
                projectUrl:
                    'https://play.google.com/store/apps/details?id=app.exchange.savita&pcampaignid=web_share',
              ),
              ProjectCard(
                imagePath: 'assets/projects/bitmet.svg',
                title: 'Bitmet',
                tag: 'Buy & Trade crypto',
                projectUrl:
                    'https://play.google.com/store/apps/details?id=com.app.bitmet&pcampaignid=web_share',
              ),
              ProjectCard(
                imagePath: 'assets/projects/Tradyex.png',
                title: 'Tradyex',
                tag: 'P2P Exchange',
                projectUrl:
                    'https://play.google.com/store/apps/details?id=com.app.tradyexapp&pcampaignid=web_share',
              ),
              ProjectCard(
                imagePath: 'assets/projects/orazo.png',
                title: 'Orazo',
                tag: 'Crypto Wallet & Lottery',
                projectUrl:
                    'https://new.demozab.com/orazo/user/orazo_user/public/#',
              ),
              ProjectCard(
                imagePath: 'assets/projects/portfolio.png',
                title: 'Portfolio',
                tag: 'Flutter Web Application',
                projectUrl: 'https://github.com/nareshsia/portfolio',
              ),
              ProjectCard(
                imagePath: 'assets/projects/starrbox.png',
                title: 'Starrbox',
                tag: 'Food Delivery - Private',
                projectUrl: '',
              ),

              // Add more ProjectCards here
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String tag;
  final String projectUrl;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.tag,
    required this.projectUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => widget.projectUrl.isNotEmpty
                ? launchUrl(Uri.parse(widget.projectUrl))
                : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
              curve: Curves.easeInOut,
              width: 280,
              // Card width
              child: Material(
                elevation: _isHovered ? 12 : 4,
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor,
                child: Stack(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                            bottom: Radius.circular(16),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 160,
                            child: _buildImage(widget.imagePath),
                          ),
                        ),

                        // const SizedBox(height: 8),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 12),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         widget.title,
                        //         style: GoogleFonts.poppins(
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //         //textAlign: TextAlign.center,
                        //       ),
                        //       const SizedBox(height: 4),
                        //       Text(
                        //         widget.tag,
                        //         style: GoogleFonts.poppins(
                        //           fontSize: 14,
                        //           color: Colors.grey[600],
                        //         ),
                        //       //  textAlign: TextAlign.center,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 8),
                      ],
                    ),
                    if (_isHovered)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          //textAlign: TextAlign.center,
        ),
        //const SizedBox(height: 2),
        Text(
          widget.tag,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
          //  textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImage(String path) {
    if (path.toLowerCase().endsWith(".svg")) {
      return SvgPicture.asset(
        path,
        fit: BoxFit.cover, // contain to show full logo
      );
    } else {
      return Image.asset(path, fit: BoxFit.cover);
    }
  }
}
