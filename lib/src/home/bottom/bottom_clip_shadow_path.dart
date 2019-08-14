//https://gist.github.com/coman3/e631fd55cd9cdf9bd4efe8ecfdbb85a7
import 'package:flutter/material.dart';

@immutable
class BottomClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  BottomClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();

    var path = new Path()
      ..moveTo(0, 35)
      ..quadraticBezierTo(size.width/2, 0, size.width, 35)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 35);

    var clipPath = path.shift(shadow.offset);


    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
