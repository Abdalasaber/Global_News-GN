import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../view/screens/us_news/business_us/us_business_screen.dart';
import '../../view/screens/us_news/entertainment_us/us_entertainment_screen.dart';
import '../../view/screens/us_news/general_us/us_general_screen.dart';
import '../../view/screens/us_news/health_us/us_health_screen.dart';
import '../../view/screens/us_news/science_us/science_screen.dart';
import '../../view/screens/us_news/sport_us/us_sport_screen.dart';
import '../../view/screens/us_news/technology_us/us_technology_screen.dart';

class TypeModel {
  Widget screen;
  String text;
  String? image;
  Color? color;
  IconData? icon;
  Color? selectedColor;

  TypeModel(
      {required this.screen,
      required this.text,
      this.image,
      this.color,
      this.icon,
      this.selectedColor});
}

List<TypeModel> itemTypeModel = [
  TypeModel(
      text: 'General',
      screen: const UsGeneralScreen(),
      color: Colors.grey,
      icon: Icons.newspaper,
      selectedColor: Colors.brown),
  TypeModel(
      text: 'Business',
      screen: const UsBusinessScreen(),
      color: Colors.grey,
      icon: Iconsax.wallet,
      selectedColor: Colors.redAccent),
  TypeModel(
      text: 'Sport',
      screen: const UsSportScreen(),
      color: Colors.grey,
      icon: Icons.sports_martial_arts_outlined,
      selectedColor: Colors.amber),
  TypeModel(
      text: 'Health',
      screen: const UsHealthScreen(),
      color: Colors.grey,
      icon: Iconsax.health,
      selectedColor: Colors.greenAccent),
  TypeModel(
      text: 'Entertainment',
      screen: const UsEntertainmentScreen(),
      color: Colors.grey,
      icon: Iconsax.happyemoji,
      selectedColor: Colors.yellow),
  TypeModel(
      text: 'Technology',
      screen: const UsTechnologyScreen(),
      color: Colors.grey,
      icon: Iconsax.electricity,
      selectedColor: Colors.deepOrange),
  TypeModel(
      text: 'Science',
      screen: const UsScienceScreen(),
      color: Colors.grey,
      icon: Iconsax.scan,
      selectedColor: Colors.blue),
];
