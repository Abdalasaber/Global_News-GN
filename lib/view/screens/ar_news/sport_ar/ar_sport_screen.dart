import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'ar_sport_grid-builder.dart';
import 'ar_sport_list_builder.dart';

class ArSportScreen extends StatefulWidget {
  const ArSportScreen({super.key});

  @override
  State<ArSportScreen> createState() => _ArSportScreenState();
}

class _ArSportScreenState extends State<ArSportScreen> {
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
                  // SizedBox(
                  //   height: 300,
                  //   child: PageView.builder(
                  //     itemCount: itemTypeModel.length-6,
                  //     itemBuilder: (context,index){
                  //       return
                  //         GeneralHead(data: itemTypeModelCard[5],);
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(text: 'Sport News :',fontSize: 20,fontWeight: FontWeight.bold,),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabSportToggleSwitch(),
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
                        child: tabSportOnToggleShow(),
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

  tabSportOnToggleShow() =>
      cubit.tabSportIndexBasicToggle.value == 0
          ?
      const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0),
        child: ArSportListBuilder(),
      )
          : cubit.tabSportIndexBasicToggle.value == 1
          ?
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: ArSportGridBuilder(),
      )
          :  DefaultText(text: 'text');

}
