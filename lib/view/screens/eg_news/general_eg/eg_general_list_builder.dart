import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class EgGeneralListBuilder extends StatefulWidget {
  const EgGeneralListBuilder({super.key});

  @override
  State<EgGeneralListBuilder> createState() => _EgGeneralListBuilderState();
}

class _EgGeneralListBuilderState extends State<EgGeneralListBuilder> {
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
                      itemCount: cubit.generalEgList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.generalEgList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.generalEgList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.generalEgList[index])?
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
