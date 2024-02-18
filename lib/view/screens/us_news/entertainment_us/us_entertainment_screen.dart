import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/default_text.dart';
import 'us_entertainment_grid-builder.dart';
import 'us_entertainment_list_builder.dart';

class UsEntertainmentScreen extends StatefulWidget {
  const UsEntertainmentScreen({super.key});

  @override
  State<UsEntertainmentScreen> createState() => _UsEntertainmentScreenState();
}

class _UsEntertainmentScreenState extends State<UsEntertainmentScreen> {
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
                  //     itemCount: itemTypeModel.length-2,
                  //     itemBuilder: (context,index){
                  //       return
                  //         GeneralHead(data: itemTypeModelCard[4],);
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(text: 'Entertainment News :',fontSize: 20,fontWeight: FontWeight.bold,),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                        child: Column(
                          children: [
                            cubit.tabEntertainmentToggleSwitch(),
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
                        child: tabEntertainmentOnToggleShow(),
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

  tabEntertainmentOnToggleShow() =>
      cubit.tabEntertainmentIndexBasicToggle.value == 0
          ?
      const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0),
        child: UsEntertainmentListBuilder(),
      )
          : cubit.tabEntertainmentIndexBasicToggle.value == 1
          ?
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: UsEntertainmentGridBuilder(),
      )
          :  DefaultText(text: 'text');

}
