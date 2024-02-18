import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class UsBusinessListView extends StatefulWidget {
  const UsBusinessListView({super.key});

  @override
  State<UsBusinessListView> createState() => _UsBusinessListViewState();
}

class _UsBusinessListViewState extends State<UsBusinessListView> {
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
                        itemCount: cubit.businessList.length,
                        itemBuilder: (context, index) {
                          return BuilderIem(data: cubit.businessList[index],
                            onPressed: () {
                              cubit.favorites(
                                cubit.businessList[index],
                              );
                            },
                            icon: cubit.favoritesList.contains(
                                cubit.businessList[index])?
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
