import 'package:flutter/widgets.dart';

import 'animation_on_hover_builder.dart';

class TranslateOnHover extends StatelessWidget {
  final Widget? child;

  const TranslateOnHover({this.child, super.key});

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
