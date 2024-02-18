import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class UsHealthListView extends StatefulWidget {
  const UsHealthListView({super.key});

  @override
  State<UsHealthListView> createState() => _UsHealthListViewState();
}

class _UsHealthListViewState extends State<UsHealthListView> {
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
                      itemCount: cubit.healthList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.healthList[index],
                          onPressed: () {
                          cubit.favorites(
                            cubit.healthList[index],
                          );
                          },
                          icon: cubit.favoritesList.contains(
                            cubit.healthList[index])?
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
