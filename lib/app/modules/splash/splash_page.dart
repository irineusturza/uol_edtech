import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:uol_edtech_challenge/app/routes/app_routes.dart';

class PageSplash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<PageSplash> with TickerProviderStateMixin {
  late AnimationController animationControllerLogo;
  Animation<double>? animationLogo;
  late AnimationController animationControllerLogoEstratosfera;
  Animation? animationLogoEstratosfera;
  late AnimationController animationControllerLogoFade;
  late Animation animationLogoFade;

  @override
  void initState() {
    super.initState();

    animationControllerLogo = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationControllerLogoEstratosfera = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    animationControllerLogoFade = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationControllerLogo.dispose();
    animationControllerLogoEstratosfera.dispose();
    animationControllerLogoFade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationLogo = Tween<double>(
      begin: MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 0,
      end: MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 0,
    ).animate(animationControllerLogo)
      ..addListener(() {
        setState(() {});
      });

    animationLogoEstratosfera = Tween<double>(
      begin: MediaQuery.of(context).orientation == Orientation.portrait ? 0.0 : 0.0,
      end: MediaQuery.of(context).orientation == Orientation.portrait ? 1.0 : 1.0,
    ).animate(animationControllerLogoEstratosfera);

    animationLogoFade = Tween<double>(
      begin: MediaQuery.of(context).orientation == Orientation.portrait ? 1.0 : 1.0,
      end: MediaQuery.of(context).orientation == Orientation.portrait ? 0.0 : 0.0,
    ).animate(animationControllerLogoFade);

    animationControllerLogo.forward();
    animationControllerLogoEstratosfera.forward();
    animationControllerLogoFade.forward();

    return SafeArea(
        bottom: true,
        top: true,
        child: Stack(
          children: <Widget>[
            SplashScreen(
              styleTextUnderTheLoader: new TextStyle(),
              loadingTextPadding: EdgeInsets.zero,
              loadingText: Text(''),
              title: Text(''),
              seconds: 8,
              navigateAfterSeconds: Routes.CLASSES,
              backgroundColor: Colors.white,
              useLoader: false,
            ),
            Container(
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Align(
                          alignment:
                              MediaQuery.of(context).orientation == Orientation.portrait ? AlignmentDirectional.center : AlignmentDirectional.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.scaleDown,
                                height: MediaQuery.of(context).orientation == Orientation.portrait
                                    ? null
                                    : MediaQuery.of(context).size.height / double.parse(dotenv.env['LOADER_ANIMATION_landscape_proportion_height']!),
                                width: MediaQuery.of(context).orientation == Orientation.portrait
                                    ? MediaQuery.of(context).size.width / double.parse(dotenv.env['LOADER_ANIMATION_portrait_proportion_width']!)
                                    : null,
                              ),
                            ],
                          )),
                  ],
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.0),
              child: FadeTransition(
                opacity: animationLogoFade as Animation<double>,
                child: Container(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
