import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/controller/cubit/layout_cubit/layout_cubit.dart';
import 'package:news_api_app/controller/cubit/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:news_api_app/controller/remote_db/dio_helper.dart';
import 'package:news_api_app/style/app_themes.dart';
import 'app_route/app_route.dart';
import 'app_route/app_router.dart';
import '../../../controller/cubit/news_cubit/news_cubit.dart';
import 'controller/cubit/theme_cubit/theme_cubit.dart';
import 'controller/local/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await MyCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getGeneralNews()
            ..getBusinessNews()
            ..getSportNews()
            ..getHealthNews()
            ..getEntertainmentNews()
            ..getTechnologyNews()
            ..getScienceNews()
            ..getGeneralEgNews()
            ..getBusinessEgNews()
            ..getSportEgNews()
            ..getHealthEgNews()
            ..getEntertainmentEgNews()
            ..getTechnologyEgNews()
            ..getScienceEgNews()
            ..getGeneralArNews()
            ..getBusinessArNews()
            ..getSportArNews()
            ..getHealthArNews()
            ..getEntertainmentArNews()
            ..getTechnologyArNews()
            ..getScienceArNews(),
        ),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeCubit.get(context).getTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Global News',
            theme: ThemeCubit.get(context).isDark
                ? Themes.darkTheme
                : Themes.lightTheme,
            initialRoute: AppRouters.splashPageRoute,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
