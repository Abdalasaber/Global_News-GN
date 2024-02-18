import 'package:flutter/cupertino.dart';
import 'package:news_api_app/view/screens/layout/layout_screen.dart';
import '../../view/screens/layout/eg_layout_screen.dart';
import '../../view/screens/layout/sa_layout_screen.dart';

class CountryModel {
  String text;
  Widget screen;
  String image;

  CountryModel({
    required this.text,
    required this.screen,
    required this.image,
  });
}

List<CountryModel> itemCountryModel = [
  CountryModel(
    text: 'Arabic News',
    screen: const SaLayoutScreen(),
    image:
        "https://cdn.pixabay.com/animation/2023/06/13/15/14/15-14-05-130__480.png",
  ),
  CountryModel(
    text: 'Egypt News',
    screen: const EgLayoutScreen(),
    image: "https://cdn-icons-png.flaticon.com/256/323/323324.png",
  ),
  CountryModel(
    text: 'United States News',
    screen: const LayoutScreen(),
    image: "https://cdn-icons-png.flaticon.com/128/197/197484.png",
  ),
];
