import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca/routes/home_route.dart';
import 'package:forca/routes/welcome_route.dart';
import 'package:forca/shared_preferences/app_preferences.dart';
import 'package:forca/widgets/cirular_image_widget.dart';

class SplashScreenRoute extends StatefulWidget {
  const SplashScreenRoute({super.key});

  @override
  _SplashScreenRouteState createState() => _SplashScreenRouteState();
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      AppPreferences.getWelcomeRead().then((status) {
        _whereToNavigate(welcomeRead: status);
      });
    });
  }

  _whereToNavigate({required bool welcomeRead}) {
    if (welcomeRead) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeRoute()));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeRoute()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularImageWidget(
            imageProvider: AssetImage(
              'assets/images/splashscreen.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 25),
            child: Text(
              "Aguarde...",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: LinearProgressIndicator(
              backgroundColor: Colors.orange[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange[900]!),
            ),
          ),
        ]);
  }
}
