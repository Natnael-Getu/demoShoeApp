import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AnimProp { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimProp>()
      ..add(AnimProp.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(AnimProp.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
          Curves.easeIn);
    return PlayAnimation<MultiTweenValues<AnimProp>>(
        child: child,
        duration: tween.duration,
        delay: Duration(milliseconds: (500 * delay).round()),
        builder: (context, child, value) {
          return Opacity(
            opacity: value.get(AnimProp.opacity),
            child: Transform.translate(
              offset: Offset(
                0,
                value.get(AnimProp.translateY),
              ),
              child: child,
            ),
          );
        },
        tween: tween);
  }
}
