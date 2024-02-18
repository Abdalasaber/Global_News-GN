import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/controller/cubit/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:news_api_app/model/on_boarding_model/on_boarding_model.dart';
import 'package:news_api_app/controller/local/enums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app_route/app_route.dart';
import '../../../controller/local/shared_preferences.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../../style/app_colors.dart';
import 'on_boarding_builder.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  // bool isLast = false;
  final controller = PageController();

  void finishOn(String screenName, BuildContext context) {
    MyCache.putBoolean(key: MyCacheKeys.onBoarding, value: cubit.isLast);
    Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  late OnBoardingCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    cubit=OnBoardingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 1000,
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == itemOnBoarding.length - 1) {
                    cubit.isTrue();
                  } else {
                    cubit.isFalse();
                  }
                },
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: itemOnBoarding.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    // Column(
                    // children: [
                      OnBoardingBuilder(
                        onBoardingModel: itemOnBoarding[index],
                      // ),
                      // const SizedBox(height: 10,),
                    // ],
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: itemOnBoarding.length,
              effect:  const WormEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: WormType.thinUnderground,
                activeDotColor: AppTheme.blueLogo,
                dotColor: Colors.black12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                return cubit.isLast
                    ? DefaultElevatedButtonBlue(
                  onPressed: () {
                    finishOn(AppRouters.countryChoicePageRoute, context);
                  },
                  text: 'Get Started',
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent)),
                )
                    : DefaultElevatedButtonBlue(
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(microseconds: 1000000),
                        curve: Curves.easeInOut);
                  },
                  text: 'Next',
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          AppTheme.blueLogo)),
                );
              },
            ),
          ],
        ),

      );
  }
}