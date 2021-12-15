import 'dart:io';

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..connectionTimeout = const Duration(seconds: 120)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
