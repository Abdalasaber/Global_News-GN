import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'us_business_grid_builder.dart';
import 'us_business_list_builder.dart';

class UsBusinessScreen extends StatefulWidget {
  const UsBusinessScreen({super.key});

  @override
  State<UsBusinessScreen> createState() => _UsBusinessScreenState();
}

class _UsBusinessScreenState extends State<UsBusinessScreen> {
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
                          text: 'Business News :',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabBusinessToggleSwitch(),
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
                        child: tabBusinessOnToggleShow(),
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

  tabBusinessOnToggleShow() => cubit.tabBusinessIndexBasicToggle.value == 0
      ? const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: UsBusinessListView(),
  )
      : cubit.tabBusinessIndexBasicToggle.value == 1
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: UsBusinessGridBuilder(),
            )
          : DefaultText(text: 'text');
}
