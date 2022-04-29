import 'package:flutter/widgets.dart';

import 'animation_on_hover_builder.dart';

class ZoomOnHover extends StatefulWidget {
  const ZoomOnHover({
    required this.isExpanded,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final bool isExpanded;

  @override
  State<ZoomOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<ZoomOnHover>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animationCurve;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    animationCurve = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutQuint,
      reverseCurve: Curves.easeInOutQuart,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 0, end: 1).animate(animationCurve);
    return AnimationOnHoverBuilder(
      builder: (_, isHovering) => AnimatedBuilder(
        animation: animation,
        builder: (_, child) {
          isHovering || widget.isExpanded
              ? animationController.forward()
              : animationController.reverse();
          return Transform.scale(
            scale: (animationCurve.value * 1.15) + 1,
            child: widget.child,
          );
        },
      ),
    );
  }
}
