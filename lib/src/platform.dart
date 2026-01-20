// Public platform detection surface that conditionally exports
// a web or non-web implementation depending on the build target.
export 'platform_stub.dart'
  if (dart.library.html) 'platform_html.dart';
