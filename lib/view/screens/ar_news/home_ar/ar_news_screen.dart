import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/model/type_model/type_model.dart';
import 'package:news_api_app/view/screens/ar_news/science_ar/ar_science_screen.dart';
import 'package:news_api_app/view/screens/ar_news/sport_ar/ar_sport_screen.dart';
import '../entertainment_ar/ar_entertainment_screen.dart';
import '../general_ar/ar_general_screen.dart';
import '../health_ar/ar_health_screen.dart';
import '../technology_ar/ar_technology_screen.dart';
import 'package:news_api_app/view/widget/builder/type_builder.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../../controller/cubit/theme_cubit/theme_cubit.dart';
import '../business_ar/ar_business_screen.dart';

class ArNewScreen extends StatefulWidget {
  const ArNewScreen({super.key});

  @override
  State<ArNewScreen> createState() => _ArNewScreenState();
}

class _ArNewScreenState extends State<ArNewScreen> with SingleTickerProviderStateMixin{
  bool isLast = false;
  final controller = PageController();
  int selectedCategoryIndex = 0;
  late NewsCubit cubit;
  late ThemeCubit themeCubit;
  late TabController tabController;
  bool isRepeat = false;

  @override
  void initState() {
    // TODO: implement initState
    cubit = NewsCubit.get(context);
    themeCubit = ThemeCubit.get(context);
    tabController = TabController(length: IconType.values.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Center(
              child: SizedBox(
                height: 200,
                child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return ThemeCubit.get(context).isDark
                          ? Image.asset(
                        'assets/image/dark_logo-color_noback.png',
                        // fit: BoxFit.cover,
                      )
                          : Image.asset(
                        'assets/image/GN_logo-color_noback.png',
                        // fit: BoxFit.cover,
                      );
                    }),
              ),
            ),
            actions: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Switch(
                      activeColor: Colors.blueAccent,
                      value: themeCubit.isDark,
                      onChanged: (value){
                        themeCubit.changeTheme();
                      });
                  },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: itemTypeModel.length,
                      itemBuilder: (context, index) {
                        return TypeBuilder(
                          typeModel: itemTypeModel[index],
                          selectedCategoryIndex: selectedCategoryIndex,
                          onCategorySelected: (index) {
                              cubit.onCategorySelected(
                              selectedCategoryIndex = index
                              );
                          },);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: getCategoryText(selectedCategoryIndex,Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget getCategoryText(int index,Color color) {
    switch (index) {
      case 0:
        return const ArGeneralScreen();
      case 1:
        return const ArBusinessScreen();
      case 2:
        return const ArSportScreen();
        case 3:
        return const ArHealthScreen();
        case 4:
        return const ArEntertainmentScreen();
        case 5:
        return const ArTechnologyScreen();
        case 6:
        return const ArScienceScreen();
      default:
        return const ArSportScreen();
    }
  }


}
