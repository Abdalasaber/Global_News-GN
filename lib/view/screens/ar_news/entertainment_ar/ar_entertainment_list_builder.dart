import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class ArEntertainmentListBuilder extends StatefulWidget {
  const ArEntertainmentListBuilder({super.key});

  @override
  State<ArEntertainmentListBuilder> createState() => _ArEntertainmentListBuilderState();
}

class _ArEntertainmentListBuilderState extends State<ArEntertainmentListBuilder> {
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
        child: Column(
          children: [
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return SizedBox(
                  height: 700,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1,
                      ),
                      itemCount: cubit.entertainmentArList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.entertainmentArList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.entertainmentArList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.entertainmentArList[index])?
                          const Icon(Icons.favorite,color: Colors.red,):
                          const Icon(Icons.favorite_border),
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
