import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class EgEntertainmentListBuilder extends StatefulWidget {
  const EgEntertainmentListBuilder({super.key});

  @override
  State<EgEntertainmentListBuilder> createState() => _EgEntertainmentListBuilderState();
}

class _EgEntertainmentListBuilderState extends State<EgEntertainmentListBuilder> {
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
                      itemCount: cubit.entertainmentEgList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.entertainmentEgList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.entertainmentEgList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.entertainmentEgList[index])?
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
