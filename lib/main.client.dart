/// The entrypoint for the **client** environment.
///
/// The [main] method will only be executed on the client when loading the page.
/// To run code on the server during pre-rendering, check the `main.server.dart` file.
library;

// Client-specific Jaspr import.
import 'dart:html' as html;
import 'package:jaspr/client.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.client.options.dart';

void main() {
  // Initializes the client environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultClientOptions,
  );

  // Set LTR direction (left-to-right)
  html.document.documentElement?.setAttribute('dir', 'ltr');
  html.document.documentElement?.setAttribute('lang', 'en');

  // Set favicon to app logo
  final link = html.document.querySelector('link[rel="icon"]') as html.LinkElement?;
  if (link != null) {
    link.href = '/images/favicon.svg';
  } else {
    final newLink = html.LinkElement()
      ..rel = 'icon'
      ..type = 'image/svg+xml'
      ..href = '/images/favicon.svg';
    html.document.head?.append(newLink);
  }

  // Starts the app.
  //
  // [ClientApp] automatically loads and renders all components annotated with @client.
  //
  // You can wrap this with additional [InheritedComponent]s to share state across multiple
  // @client components if needed.
  runApp(
    const ClientApp(),
  );
}
