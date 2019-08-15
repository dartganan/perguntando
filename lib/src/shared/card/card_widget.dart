import 'package:flutter/material.dart';
export 'card_shimmer.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  const CardWidget({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.subtitle,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 170,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
