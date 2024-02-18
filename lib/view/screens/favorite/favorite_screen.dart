import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/cubit/news_cubit/news_cubit.dart';
import '../../widget/default_text.dart';
import '../../widget/builder/item_builder.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late NewsCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = NewsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: DefaultText(
                  text: ''
                      '${cubit.favoritesList.length} News in favorites',
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRouters.layoutPageRoute);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                    height: 700,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1,
                            ),
                        itemCount: cubit.favoritesList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              cubit.favoritesList.isEmpty
                                  ? DefaultText(
                                      text: 'non',
                                      fontSize: 50,
                                      color: Colors.red,
                                    )
                                  :
                              BuilderIem(
                                      data: cubit.favoritesList[index],
                                      onPressed: () {
                                        cubit.favorites(
                                          cubit.favoritesList[index],
                                        );
                                      },
                                      icon: cubit.favoritesList.contains(
                                              cubit.favoritesList[index])
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(Icons.favorite_border),
                                    ),
                            ],
                          );
                        }),),
              ]),
            ));
      },
    );
  }
}
