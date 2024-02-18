import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/model/type_model/type_model.dart';
import 'package:news_api_app/view/screens/us_news/business_us/us_business_screen.dart';
import 'package:news_api_app/view/screens/us_news/entertainment_us/us_entertainment_screen.dart';
import 'package:news_api_app/view/screens/us_news/general_us/us_general_screen.dart';
import 'package:news_api_app/view/screens/us_news/health_us/us_health_screen.dart';
import 'package:news_api_app/view/screens/us_news/science_us/science_screen.dart';
import 'package:news_api_app/view/screens/us_news/sport_us/us_sport_screen.dart';
import 'package:news_api_app/view/screens/us_news/technology_us/us_technology_screen.dart';
import 'package:news_api_app/view/widget/builder/type_builder.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../../controller/cubit/theme_cubit/theme_cubit.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with SingleTickerProviderStateMixin{
  bool isLast = false;
  final controller = PageController();
  int selectedCategoryIndex = 0; // Add this variable to track the selected category index
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
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,),
            ),
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
        return const UsGeneralScreen();
      case 1:
        return const UsBusinessScreen();
      case 2:
        return const UsSportScreen();
        case 3:
        return const UsHealthScreen();
        case 4:
        return const UsEntertainmentScreen();
        case 5:
        return const UsTechnologyScreen();
        case 6:
        return const UsScienceScreen();
      default:
        return const UsSportScreen();
    }
  }


}
