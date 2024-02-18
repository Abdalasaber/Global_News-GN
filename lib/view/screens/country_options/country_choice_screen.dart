import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/model/country_model/country_model.dart';
import 'package:news_api_app/view/screens/country_options/country_builder.dart';
import '../../../controller/cubit/theme_cubit/theme_cubit.dart';

class CountryChoiceScreen extends StatelessWidget {
  const CountryChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
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
              },
            ),
          ),
        ),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Switch(
                  activeColor: Colors.blueAccent,
                  value: ThemeCubit.get(context).isDark,
                  onChanged: (value) {
                    ThemeCubit.get(context).changeTheme();
                  });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                height: 50,
              ),
              itemCount: itemCountryModel.length,
              itemBuilder: (context, index) {
                return CountryBuilder(countryModel: itemCountryModel[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
