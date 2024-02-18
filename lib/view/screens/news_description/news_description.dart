import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_app/model/news_model/articles_model.dart';
import '../../widget/default_text.dart';
import '../../../controller/cubit/theme_cubit/theme_cubit.dart';

class NewsDE extends StatefulWidget {
  final Articles data;

  const NewsDE({Key? key, required this.data}) : super(key: key);

  @override
  State<NewsDE> createState() => JopDetailsScreen();
}

class JopDetailsScreen extends State<NewsDE> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 320,
                    width: 550,
                    // color: Colors.cyan,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage("${widget.data.urlToImage}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 278.5,
                    // right: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 370.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                  Icons.arrow_circle_right_outlined)),
                        ),
                      ),
                    ),
                  ),
                ]),
            Container(
                height: 410,
                width: 550,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  // color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: widget.data.title ?? " null",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultText(
                          text: widget.data.description ?? " null",
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefaultText(
                          text: 'Author by: ${widget.data.author ?? " null"}',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultText(
                          text:
                              'PublishedAt: ${widget.data.publishedAt ?? " null"}',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 350),
                          child: BlocBuilder<ThemeCubit, ThemeState>(
                            builder: (context, state) {
                              return Switch(
                                  activeColor: Colors.blueAccent,
                                  value: ThemeCubit.get(context).isDark,
                                  onChanged: (value) {
                                    ThemeCubit.get(context).changeTheme();
                                  });
                            },
                          ),
                        ),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
