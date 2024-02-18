import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class ArSportListBuilder extends StatefulWidget {
  const ArSportListBuilder({super.key});

  @override
  State<ArSportListBuilder> createState() => _ArSportListBuilderState();
}

class _ArSportListBuilderState extends State<ArSportListBuilder> {
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
                      itemCount: cubit.sportArList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.sportArList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.sportArList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.sportArList[index])?
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
