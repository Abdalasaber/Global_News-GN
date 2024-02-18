import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/builder/build_grid_item.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';

class ArBusinessGridBuilder extends StatefulWidget {
  const ArBusinessGridBuilder({super.key});

  @override
  State<ArBusinessGridBuilder> createState() => _ArBusinessGridBuilderState();
}

class _ArBusinessGridBuilderState extends State<ArBusinessGridBuilder> {
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
        child: AnimatedSwitcher(duration: const
        Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
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
                        itemCount: cubit.businessArList.length,
                        itemBuilder: (context, index) {
                          return BuilderGridIem(
                            data: cubit.businessArList[index],
                            onPressed: () {
                              cubit.favorites(
                                cubit.businessArList[index],
                              );
                            },
                            icon: cubit.favoritesList
                                    .contains(cubit.businessArList[index])
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
      ),
    );
  }
}
