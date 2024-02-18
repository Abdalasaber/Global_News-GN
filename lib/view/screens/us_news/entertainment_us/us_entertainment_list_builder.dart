import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class UsEntertainmentListBuilder extends StatefulWidget {
  const UsEntertainmentListBuilder({super.key});

  @override
  State<UsEntertainmentListBuilder> createState() => _UsEntertainmentListBuilderState();
}

class _UsEntertainmentListBuilderState extends State<UsEntertainmentListBuilder> {
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
                      itemCount: cubit.entertainmentList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(data: cubit.entertainmentList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.entertainmentList[index],
                            );
                          },
                          icon: cubit.favoritesList.contains(
                              cubit.entertainmentList[index])?
                          Icon(Icons.favorite,color: Colors.red,):
                          Icon(Icons.favorite_border),
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
