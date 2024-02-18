import 'package:flutter/material.dart';
import 'package:news_api_app/model/news_model/articles_model.dart';
import '../view/screens/us_news/home_us/news_screen.dart';
import '../view/screens/on_boarding/on_boarding_screen.dart';
import '../view/screens/splash/splash_screen.dart';
import '../view/screens/country_options/country_choice_screen.dart';
import '../view/screens/favorite/favorite_screen.dart';
import '../view/screens/layout/eg_layout_screen.dart';
import '../view/screens/layout/layout_screen.dart';
import '../view/screens/news_description/news_description.dart';
import 'app_route.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
  switch(routeSettings.name) {

    case(AppRouters.splashPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      }
      case(AppRouters.onboardPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      }

      case(AppRouters.countryChoicePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const CountryChoiceScreen());
      }
      case(AppRouters.egLayoutPageRoute):
      {
        return MaterialPageRoute(builder: (context) =>  EgLayoutScreen());
      }

      case(AppRouters.layoutPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      }

      case(AppRouters.homePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const NewScreen());
      }
      case(AppRouters.newsDetailsPageRoute):
      {
        final args = routeSettings.arguments as Articles;
        return MaterialPageRoute(builder: (context) =>NewsDE(data: args,));
      }

      case(AppRouters.favoritePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      }



    default:
      return null;
      }

}

