import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/view/screens/favorite/favorite_screen.dart';
import 'package:news_api_app/view/screens/us_news/home_us/news_screen.dart';
import '../../../view/screens/eg_news/home_eg/eg_news_screen.dart';
import '../../../view/screens/ar_news/home_ar/ar_news_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<String>labels =[
    'News',
    'Favorite',
  ];
  void changeNavBar(int index){
    currentIndex= index;
    emit(ChangeNavBarState());
  }

  List<Widget>screens=[
    const NewScreen(),
    const FavoriteScreen(),
  ];
  List<Widget>egScreens=[
    const EgNewScreen(),
    const FavoriteScreen(),
  ];
  List<Widget>saScreens=[
    const ArNewScreen(),
    const FavoriteScreen(),
  ];

}
