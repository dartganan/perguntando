import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../question_module.dart';
import '../question_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size;
  CustomAppBar(this.size);

  @override
  Size get preferredSize => Size.fromHeight(size);

  @override
  Widget build(BuildContext context) {
    final questionBloc = QuestionModule.to.bloc<QuestionBloc>();

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: questionBloc.tag,
          child: Card(elevation: 10),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BackButton(color: Theme.of(context).primaryColor),
                Hero(
                  tag: "${questionBloc.tag}_image",
                  child: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                        "https://i.udemycdn.com/user/200_H/51101684_c590_2.jpg",
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: "${questionBloc.tag}_name",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              "Jacob Moura",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Hero(
                          tag: "${questionBloc.tag}_talk",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              "Nunca diga não para o seu designer",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: "${questionBloc.tag}_time",
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "10:00",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
