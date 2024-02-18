import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/build_grid_item.dart';

class EgEntertainmentGridBuilder extends StatefulWidget {
  const EgEntertainmentGridBuilder({super.key});

  @override
  State<EgEntertainmentGridBuilder> createState() => _EgEntertainmentGridBuilderState();
}

class _EgEntertainmentGridBuilderState extends State<EgEntertainmentGridBuilder> {
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
                      itemCount: cubit.entertainmentEgList.length,
                      itemBuilder: (context, index) {
                        return BuilderGridIem(
                          data: cubit.entertainmentEgList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.entertainmentEgList[index],
                            );
                          },
                          icon: cubit.favoritesList
                              .contains(cubit.entertainmentEgList[index])
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
