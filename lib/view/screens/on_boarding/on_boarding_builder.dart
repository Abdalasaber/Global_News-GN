import 'package:flutter/material.dart';
import '../../../model/on_boarding_model/on_boarding_model.dart';
import '../../../style/app_colors.dart';

class OnBoardingBuilder extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnBoardingBuilder({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            onBoardingModel.image,
            fit: BoxFit.cover,
            // width: 500,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: onBoardingModel.text,
                      style: const TextStyle(color: AppTheme.black, fontSize: 28,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: onBoardingModel.textAnotherColor,
                        style: const TextStyle(
                            color: AppTheme.blueLogo, fontSize: 28,fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: onBoardingModel.textFirstColor,
                        style: const TextStyle(color: AppTheme.black, fontSize: 28,fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
          const SizedBox(
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
