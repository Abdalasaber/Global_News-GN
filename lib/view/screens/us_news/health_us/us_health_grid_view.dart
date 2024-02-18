import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/build_grid_item.dart';

class UsHealthGridView extends StatefulWidget {
  const UsHealthGridView({super.key});

  @override
  State<UsHealthGridView> createState() => _UsHealthGridViewState();
}

class _UsHealthGridViewState extends State<UsHealthGridView> {
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
                  child: GridView.builder(
                      // separatorBuilder: (context, index) => const Divider(
                      //   thickness: 1,
                      // ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      // crossAxisSpacing: 10,
                      // mainAxisExtent: 10,
                      mainAxisSpacing:20
                    ),
                      itemCount: cubit.healthList.length,
                      itemBuilder: (context, index) {
                        return BuilderGridIem(data: cubit.healthList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.healthList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.healthList[index])?
                          const Icon(Icons.favorite,color: Colors.red,):
                          const Icon(Icons.favorite_border,color: Colors.black),
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
