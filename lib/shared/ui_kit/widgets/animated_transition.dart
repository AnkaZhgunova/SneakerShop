import 'package:flutter/cupertino.dart';

class AnimatedTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Curve curve;
  final Axis axis;

  const AnimatedTransition({
    required this.child,
    required this.axis,
    this.curve = Curves.easeIn,
    this.offset = 140,
    this.duration = const Duration(milliseconds: 400),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      curve: curve,
      duration: duration,
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0.0)
              : Offset(0.0, value * offset),
          child: child,
        );
      },
    );
  }
}
