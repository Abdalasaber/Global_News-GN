import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/build_grid_item.dart';

class UsBusinessGridBuilder extends StatefulWidget {
  const UsBusinessGridBuilder({super.key});

  @override
  State<UsBusinessGridBuilder> createState() => _UsBusinessGridBuilderState();
}

class _UsBusinessGridBuilderState extends State<UsBusinessGridBuilder> {
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
                                mainAxisSpacing: 20,
                            ),
                        itemCount: cubit.businessList.length,
                        itemBuilder: (context, index) {
                          return BuilderGridIem(
                            data: cubit.businessList[index],
                            onPressed: () {
                              cubit.favorites(
                                cubit.businessList[index],
                              );
                            },
                            icon: cubit.favoritesList
                                    .contains(cubit.businessList[index])
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
