import 'package:flutter/material.dart';
import '../../../app_route/app_route.dart';
import '../../../model/news_model/articles_model.dart';
import '../../widget/default_text.dart';

class BuilderGridIem extends StatelessWidget {
  final Articles data;
  final void Function()? onPressed;
  final Widget icon;
  const BuilderGridIem(
      {super.key,
      required this.data,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.newsDetailsPageRoute,
            arguments: data);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
        child: Container(
          // height: 700,
          // width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: data.urlToImage != null
                            ? Image.network(
                                "${data.urlToImage}",
                                fit: BoxFit.cover,
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 210),
                      child: DefaultText(
                        text: data.title ?? " null",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: IconButton(
                            onPressed: onPressed,
                            // () {},
                            icon: icon,
                            // Icon(
                            //     Icons.favorite_border
                            // )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
