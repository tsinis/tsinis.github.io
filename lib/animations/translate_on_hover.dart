import 'package:flutter/widgets.dart';

import 'animation_on_hover_builder.dart';

class TranslateOnHover extends StatelessWidget {
  const TranslateOnHover({this.child, Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) => AnimationOnHoverBuilder(
        builder: (_, isHovering) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isHovering
              ? (Matrix4.identity()..translate(0, -5))
              : Matrix4.identity(),
          child: child,
        ),
      );
}
