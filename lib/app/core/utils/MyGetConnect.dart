import 'package:get/get.dart';

class MyGetConnect extends GetConnect {
  @override
  bool get allowAutoSignedCert => true;

  @override
  Duration get timeout => timeout = const Duration(seconds: 120);
}
