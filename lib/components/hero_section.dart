import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/theme.dart';
import '../src/platform.dart';

/// Hero section with scroll-based image and content swapping
@client
class HeroSection extends StatefulComponent {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => HeroSectionState();
}

class HeroSectionState extends State<HeroSection> {
  int currentIndex = 0;
  bool isVisible = true;

  final List<HeroContent> content = [
    HeroContent(
      image: '/images/Whisk_80e07c177695808b02f4de9dacf52a2adr.png',
      title: 'یادگیری برنامه‌نویسی',
      description: 'مسیرهای ساختاریافته برای تبدیل شدن به یک توسعه‌دهنده حرفه‌ای',
      subtitle: 'از مبتدی تا پیشرفته',
    ),
    HeroContent(
      image: '/images/Whisk_68584734ba52838a9994c01a82cf72dfdr.png',
      title: 'جامعه توسعه‌دهندگان',
      description: 'با سایر توسعه‌دهندگان افغانستانی ارتباط برقرار کنید و مهارت‌های خود را تقویت کنید',
      subtitle: 'یادگیری مشترک',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Only run the auto-swap timer on the client (browser).
    if (isClient) {
      _setupScrollListener();
    }
  }

  void _setupScrollListener() {
    // Auto-swap every 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isVisible = false;
        });
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              currentIndex = (currentIndex + 1) % content.length;
              isVisible = true;
            });
            _setupScrollListener();
          }
        });
      }
    });
  }

  @override
  Component build(BuildContext context) {
    final current = content[currentIndex];

    return div(
      classes: 'hero-section',
      [
        div(
          classes: 'hero-container',
          [
            div(
              classes: 'hero-content ${isVisible ? 'visible' : 'hidden'}',
              [
                div(
                  classes: 'hero-text',
                  [
                    h1(
                      classes: 'hero-title',
                      [.text(current.title)],
                    ),
                    p(
                      classes: 'hero-subtitle',
                      [.text(current.subtitle)],
                    ),
                    p(
                      classes: 'hero-description',
                      [.text(current.description)],
                    ),
                  ],
                ),
                div(
                  classes: 'hero-image-wrapper',
                  [
                    img(
                      src: current.image,
                      alt: current.title,
                      classes: 'hero-image',
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: 'hero-indicators',
              content.asMap().entries.map((entry) {
                final index = entry.key;
                return div(
                  classes: 'hero-indicator ${index == currentIndex ? 'active' : ''}',
                  events: {
                    'click': (e) {
                      setState(() {
                        isVisible = false;
                      });
                      Future.delayed(Duration(milliseconds: 300), () {
                        if (mounted) {
                          setState(() {
                            currentIndex = index;
                            isVisible = true;
                          });
                        }
                      });
                    },
                  },
                  [],
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero-section').styles( 
      textAlign: .right, 
      margin: .only(bottom: 4.rem),
      overflow: .hidden,
      display: .block,
      justifyContent: .center,
    ),
    css('.hero-container').styles(
      maxWidth: 1200.px,
      padding: .all(2.rem),
    ),
    css('.hero-content').styles(
      display: .block,
      flexDirection: .row,
      alignItems: .center,
      minHeight: 400.px,
    ),
    css('.hero-content.visible').styles(
      opacity: 1,
    ),
    css('.hero-content.hidden').styles(
      opacity: 0,
    ),
    css('.hero-text').styles(
      display: .flex,
      flexDirection: .column,
      justifyContent: .center,
      padding: .only(right: 3.rem),
    ),
    css('.hero-title').styles(
      fontSize: 3.rem,
      fontWeight: .bold,
      color: ContentColors.primary,
      margin: .only(bottom: 1.rem),
      lineHeight: 4.5.rem,
      letterSpacing: 0.02.em,
    ),
    css('.hero-subtitle').styles(
      fontSize: 1.5.rem,
      color: ContentColors.primary.withOpacity(0.8),
      margin: .only(top: 0.5.rem),
      fontWeight: .w500,
      lineHeight: 1.4.rem,
    ),
    css('.hero-description').styles(
      fontSize: 1.25.rem,
      color: Colors.black.withOpacity(0.7),
      margin: .only(top: 1.5.rem),
      lineHeight: 1.8.rem,
    ),
    css('.hero-image-wrapper').styles(
      display: .flex,
      justifyContent: .center,
      alignItems: .center,
      maxWidth: 600.px,
    ),
    css('.hero-image').styles(
      maxWidth: 500.px,
      radius: .circular(1.rem),
    ),
    css('.hero-indicators').styles(
      display: .flex,
      justifyContent: .center,
      margin: .only(top: 2.rem),
    ),
    css('.hero-indicator').styles(
      width: 12.px,
      height: 12.px,
      radius: .circular(6.px),
      backgroundColor: Colors.black.withOpacity(0.2),
      cursor: .pointer,
      margin: .only(right: 0.75.rem),
    ),
    css('.hero-indicator.active').styles(
      backgroundColor: ContentColors.primary,
      width: 32.px,
    ),
  ];
}

class HeroContent {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  HeroContent({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}
