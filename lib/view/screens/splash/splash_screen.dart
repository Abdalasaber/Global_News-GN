import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_api_app/controller/local/enums.dart';
import '../../../app_route/app_route.dart';
import '../../../controller/local/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // use the Future with .delayed to use delayed and select the delayed then and where want to go by navigator.pushReplacement
    Timer(
      const Duration(milliseconds: 3500),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context,
            MyCache.getBoolean(key: MyCacheKeys.onBoarding)
                ? AppRouters.countryChoicePageRoute
                : AppRouters.onboardPageRoute,
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/image/splash_gif.gif',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
