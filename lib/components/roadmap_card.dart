import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/theme.dart';

class RoadmapCard extends StatelessComponent {
  final String title;
  final String description;
  final String href;
  final String icon;

  const RoadmapCard({
    required this.title,
    required this.description,
    required this.href,
    required this.icon,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return a(
      href: href,
      classes: 'roadmap-card',
      [
        div(
          classes: 'roadmap-card-header',
          [
            div(
              classes: 'roadmap-card-icon',
              [.text(icon)],
            ),
            h3(
              classes: 'roadmap-card-title',
              [.text(title)],
            ),
          ],
        ),
        p(
          classes: 'roadmap-card-description',
          [.text(description)],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.roadmap-card').styles(      display: .block,
      padding: .all(1.5.rem),
      margin: .only(bottom: 1.25.rem),
      radius: .circular(0.75.rem),
      backgroundColor: Colors.white,
      border: .all(color: ContentColors.primary.withOpacity(0.2)),
      textDecoration: .none,
      color: Colors.black,
    ),
    css('.roadmap-card:hover').styles(
      border: .all(color: ContentColors.primary),
    ),
    css('.roadmap-card-header').styles(
      display: .flex,
      alignItems: .center,
      margin: .only(bottom: 0.75.rem),
    ),
    css('.roadmap-card-header > *:not(:last-child)').styles(
      margin: .only(right: 1.rem),
    ),
    css('.roadmap-card-icon').styles(
      width: 3.rem,
      height: 3.rem,
      radius: .circular(0.5.rem),
      backgroundColor: ContentColors.primary.withOpacity(0.1),
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      fontSize: 1.5.rem,
    ),
    css('.roadmap-card-title').styles(
      fontSize: 1.375.rem,
      fontWeight: .bold,
      color: ContentColors.primary,
      margin: .zero,
    ),
    css('.roadmap-card-description').styles(
      fontSize: 1.rem,
      color: Colors.black.withOpacity(0.7),
      lineHeight: 1.6.rem,
      margin: .zero,
    ),
  ];
}
