import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'ar_technology_grid-builder.dart';
import 'ar_technology_list_builder.dart';

class ArTechnologyScreen extends StatefulWidget {
  const ArTechnologyScreen({super.key});

  @override
  State<ArTechnologyScreen> createState() => _ArTechnologyScreenState();
}

class _ArTechnologyScreenState extends State<ArTechnologyScreen> {
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
                  const SizedBox(height: 10,),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(text: 'Technology News :',fontSize: 20,fontWeight: FontWeight.bold,),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabTechnologyToggleSwitch(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Column(
                    children: [
                      SizedBox(
                        height: 700,
                        child: tabTechnologyOnToggleShow(),
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

  tabTechnologyOnToggleShow() =>
      cubit.tabTechnologyIndexToggle.value == 0
          ?
      const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0),
        child: ArTechnologyListBuilder(),
      )
          : cubit.tabTechnologyIndexToggle.value == 1
          ?
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: ArTechnologyGridBuilder(),
      )
          :  DefaultText(text: 'text');

}
