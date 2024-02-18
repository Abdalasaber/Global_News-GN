import 'package:flutter/material.dart';
import '../../../app_route/app_route.dart';
import '../../../model/news_model/articles_model.dart';
import '../../widget/default_text.dart';

class BuilderIem extends StatefulWidget {
  final Articles data;
  final void Function()? onPressed;
  final Widget icon;
  const BuilderIem(
      {super.key,
      required this.data,
      required this.onPressed,
      required this.icon});

  @override
  State<BuilderIem> createState() => _BuilderIemState();
}

class _BuilderIemState extends State<BuilderIem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouters.newsDetailsPageRoute,
            arguments: widget.data);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
          height: 100,
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
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: widget.data.urlToImage != null
                            ? Image.network(
                                "${widget.data.urlToImage}",
                                fit: BoxFit.cover,
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 5.0),
                      child: DefaultText(
                        text: widget.data.title ?? " null",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0, top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultText(
                            text: '',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                          ),
                          // ),
                          IconButton(
                              onPressed: widget.onPressed, icon: widget.icon
                              // Icon(Icons.favorite_border)
                              ),
                        ],
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
