import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/build_grid_item.dart';

class UsSportGridBuilder extends StatefulWidget {
  const UsSportGridBuilder({super.key});

  @override
  State<UsSportGridBuilder> createState() => _UsSportGridBuilderState();
}

class _UsSportGridBuilderState extends State<UsSportGridBuilder> {
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
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          mainAxisSpacing: 20),
                      itemCount: cubit.sportList.length,
                      itemBuilder: (context, index) {
                        return BuilderGridIem(
                          data: cubit.sportList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.sportList[index],
                            );
                          },
                          icon: cubit.favoritesList
                              .contains(cubit.sportList[index])
                              ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                              : const Icon(Icons.favorite_border,color: Colors.black),
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
