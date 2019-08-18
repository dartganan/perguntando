import 'package:flutter/material.dart';
import 'sliver_footer.dart';

class ScrollableContentWidget extends StatelessWidget {
  final List<Widget> children;
  final Widget button;
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;

  const ScrollableContentWidget({
    Key key,
    @required this.children,
    this.button,
    this.padding = const EdgeInsets.all(30),
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: padding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment,
                  children: children,
                ),
              )
            ]),
          ),
          SliverFooter(child: button != null ? button : Container()),
        ],
      ),
    );
  }
}
