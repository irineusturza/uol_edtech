import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:uol_edtech_challenge/app/core/utils/DevHttpOverrides.dart';
import 'package:uol_edtech_challenge/app/routes/app_pages.dart';
import 'package:uol_edtech_challenge/app/routes/app_routes.dart';

void main() async {
  HttpOverrides.global = new DevHttpOverrides();

  //TODO: In a normal Scenario the correct thing to do is to add the .env file as an entry in .gitignore
  await dotenv.load(fileName: '.env');

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en'), Locale('es'), Locale('pt', 'BR')],
    path: 'assets/langs',
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: dotenv.env['TITLE']??"No title",
      transitionDuration: Duration(milliseconds: 300),
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH_SCREEN,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }

}