/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/components/code_block.dart';
import 'package:jaspr_content/components/header.dart';
import 'package:jaspr_content/components/image.dart';
import 'package:jaspr_content/components/sidebar.dart';
import 'package:jaspr_content/components/theme_toggle.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

import 'components/clicker.dart';
import 'components/roadmap_card.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [ContentApp] spins up the content rendering pipeline from jaspr_content to render
  // your markdown files in the content/ directory to a beautiful documentation site.
  runApp(
    ContentApp(
      // Enables mustache templating inside the markdown files.
      templateEngine: MustacheTemplateEngine(),
      parsers: [
        MarkdownParser(),
      ],
      extensions: [
        // Adds heading anchors to each heading.
        HeadingAnchorsExtension(),
        // Generates a table of contents for each page.
        TableOfContentsExtension(),
      ],
      components: [
        // The <Info> block and other callouts.
        Callout(),
        // Adds syntax highlighting to code blocks.
        CodeBlock(),
        // Adds a custom Jaspr component to be used as <Clicker/> in markdown.
        CustomComponent(
          pattern: 'Clicker',
          builder: (_, _, _) => Clicker(),
        ),
        // Adds roadmap card component.
        CustomComponent(
          pattern: 'RoadmapCard',
          builder: (attributes, _, _) {
            final attrs = attributes as Map<String, dynamic>;
            return RoadmapCard(
              title: attrs['title']?.toString() ?? '',
              description: attrs['description']?.toString() ?? '',
              href: attrs['href']?.toString() ?? '#',
              icon: attrs['icon']?.toString() ?? '📚',
            );
          },
        ),
        // Adds zooming and caption support to images.
        Image(zoom: true),
      ],
      layouts: [
        // Out-of-the-box layout for documentation sites.
        DocsLayout(
          header: Header(
            title: 'DEVPATH',
            logo: '/images/logo.svg',
            items: [
              // Enables switching between light and dark mode.
              ThemeToggle(),
            ],
          ),
          sidebar: Sidebar(
            groups: [
              // Adds navigation links to the sidebar.
              SidebarGroup(
                links: [
                  SidebarLink(text: "صفحه اصلی", href: '/'),
                ],
              ),
              SidebarGroup(
                title: 'مسیرهای یادگیری',
                links: [
                  SidebarLink(text: "توسعه وب", href: '/web'),
                  SidebarLink(text: "موبایل", href: '/mobile'),
                  SidebarLink(text: "علم داده", href: '/data-science'),
                  SidebarLink(text: "DevOps و مدیریت سیستم", href: '/devops'),
                ],
              ),
            ],
          ),
        ),
      ],
      theme: ContentTheme(
        // Customizes the default theme colors - Blue primary, Orange for accents.
        primary: ThemeColor(ThemeColors.blue.$600, dark: ThemeColors.blue.$400),
        background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
        colors: [
          ContentColors.quoteBorders.apply(ThemeColors.orange.$400),
        ],
      ),
    ),
  );
}
