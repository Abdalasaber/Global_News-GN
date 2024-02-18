import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'us_health_grid_view.dart';
import 'us_health_list_view.dart';

class UsHealthScreen extends StatefulWidget {
  const UsHealthScreen({super.key});

  @override
  State<UsHealthScreen> createState() => _UsHealthScreenState();
}

class _UsHealthScreenState extends State<UsHealthScreen> {
  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  PageController pageController = PageController();

  late NewsCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = NewsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: 'Health News :',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabToggleSwitch(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 700,
                        child: tabOnToggleShow(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  tabOnToggleShow() => cubit.tabIndexBasicToggle.value == 0
      ? const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: UsHealthListView(),
        )
      : cubit.tabIndexBasicToggle.value == 1
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: UsHealthGridView(),
            )
          : DefaultText(text: 'text');
}
