import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'eg_general_grid_builder.dart';
import 'eg_general_list_builder.dart';
class EgGeneralScreen extends StatefulWidget {
  const EgGeneralScreen({super.key});

  @override
  State<EgGeneralScreen> createState() => _EgGeneralScreenState();
}

class _EgGeneralScreenState extends State<EgGeneralScreen> {
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
                      DefaultText(text: 'General News :',fontSize: 20,fontWeight: FontWeight.bold),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabGeneralToggleSwitch(),
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

  tabBusinessOnToggleShow() =>
      cubit.tabGeneralIndexBasicToggle.value == 0
          ?
      const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0),
        child: EgGeneralListBuilder(),
      )
          : cubit.tabGeneralIndexBasicToggle.value == 1
          ?
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: EgGeneralGridBuilder(),
      )
          :  DefaultText(text: 'text');

}
