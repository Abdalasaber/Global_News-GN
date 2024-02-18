import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class ArBusinessListView extends StatefulWidget {
  const ArBusinessListView({super.key});

  @override
  State<ArBusinessListView> createState() => _ArBusinessListViewState();
}

class _ArBusinessListViewState extends State<ArBusinessListView> {
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
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                        ),
                        itemCount: cubit.businessArList.length,
                        itemBuilder: (context, index) {
                          return BuilderIem(data: cubit.businessArList[index],
                            onPressed: () {
                              cubit.favorites(
                                cubit.businessArList[index],
                              );
                            },
                            icon: cubit.favoritesList.contains(
                                cubit.businessArList[index])?
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
      ),

    );
  }
}
