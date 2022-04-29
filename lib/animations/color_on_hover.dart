import 'package:flutter/widgets.dart';

import '../themes/colors.dart';
import 'animation_on_hover_builder.dart';

class ColorOnHover extends StatelessWidget {
  const ColorOnHover({required this.isExpanded, this.child, Key? key})
      : super(key: key);

  final Widget? child;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) => AnimationOnHoverBuilder(
        builder: (_, isHovering) => AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              isHovering || isExpanded
                  ? MyColors.transparent
                  : MyColors.primaryColor,
              BlendMode.saturation,
            ),
            child: child,
          ),
        ),
      );
}
