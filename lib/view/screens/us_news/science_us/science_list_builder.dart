import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../../widget/builder/item_builder.dart';

class UsScienceListBuilder extends StatefulWidget {
  const UsScienceListBuilder({super.key});

  @override
  State<UsScienceListBuilder> createState() => _UsScienceListBuilderState();
}

class _UsScienceListBuilderState extends State<UsScienceListBuilder> {
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
                      itemCount: cubit.scienceList.length,
                      itemBuilder: (context, index) {
                        return BuilderIem(
                          data: cubit.scienceList[index],
                          onPressed: () {
                            cubit.favorites(
                              cubit.scienceList[index],
                            );
                          },
                          icon: cubit.favoritesList
                                  .contains(cubit.scienceList[index])
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border),
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
