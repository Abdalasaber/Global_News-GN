import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_api_app/model/country_model/country_model.dart';
import '../../../controller/cubit/layout_cubit/layout_cubit.dart';

class SaLayoutScreen extends StatefulWidget {
  final CountryModel? countryModel;
  const SaLayoutScreen({Key? key,this.countryModel}) : super(key: key);

  @override
  State<SaLayoutScreen> createState() => _SaLayoutScreenState();
}

class _SaLayoutScreenState extends State<SaLayoutScreen> {
  late LayoutCubit cubit;
  final bool = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = LayoutCubit.get(context);
    cubit.changeNavBar(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body:
          AnimatedSwitcher(duration: const
          Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child:
              // widget.countryModel?.text == 'Sa' ?
              cubit.saScreens[cubit.currentIndex]
            // :
            // cubit.screens[cubit.currentIndex],
          ),

          bottomNavigationBar:
          BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
            selectedItemColor: Colors.blueAccent,
            selectedLabelStyle: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
            selectedIconTheme: const IconThemeData(
                color: Colors.blueAccent
            ),
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.home,
                ),
                activeIcon: const Icon(
                  Iconsax.home_15,
                ),
                label: cubit.labels[0],
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.favorite_chart4,
                  ),
                  activeIcon: const Icon(
                    Iconsax.favorite_chart5,
                  ),
                  label: cubit.labels[1]),
            ],
          ),
        );
      },
    );
  }
}
