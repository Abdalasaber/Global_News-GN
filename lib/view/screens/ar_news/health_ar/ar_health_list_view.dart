import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class ArHealthListView extends StatefulWidget {
  const ArHealthListView({super.key});

  @override
  State<ArHealthListView> createState() => _ArHealthListViewState();
}

class _ArHealthListViewState extends State<ArHealthListView> {
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
                      itemCount: cubit.healthArList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.healthArList[index],
                          onPressed: () {
                          cubit.favorites(
                            cubit.healthArList[index],
                          );
                          },
                          icon: cubit.favoritesList.contains(
                            cubit.healthArList[index])?
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
