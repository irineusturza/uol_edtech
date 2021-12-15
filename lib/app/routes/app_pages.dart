import 'package:uol_edtech_challenge/app/modules/classes/page_classes.dart';
import 'package:uol_edtech_challenge/app/modules/splash/splash_page.dart';
import 'package:uol_edtech_challenge/app/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.CLASSES, page: () => PageClasses()),
    GetPage(name: Routes.SPLASH_SCREEN, page: () => PageSplash()),

  ];
}
