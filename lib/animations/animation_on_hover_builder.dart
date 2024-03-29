import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class AnimationOnHoverBuilder extends StatefulWidget {
  // ignore: avoid_positional_boolean_parameters, it's builder.
  final Widget Function(BuildContext context, bool isHovering) builder;
  final void Function(PointerHoverEvent)? onHover;

  const AnimationOnHoverBuilder({
    required this.builder,
    this.onHover,
    super.key,
  });

  @override
  State<AnimationOnHoverBuilder> createState() =>
      _AnimationOnHoverBuilderState();
}

class _AnimationOnHoverBuilderState extends State<AnimationOnHoverBuilder> {
  bool _isHovering = false;

  void _changeHoverState(PointerEvent event) =>
      setState(() => _isHovering = event is PointerEnterEvent);

  Widget _buildWithHovering(BuildContext context) =>
      widget.builder(context, _isHovering);

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: MouseRegion(
          onEnter: _changeHoverState,
          onExit: _changeHoverState,
          onHover: widget.onHover,
          child: Builder(builder: _buildWithHovering),
        ),
      );
}
