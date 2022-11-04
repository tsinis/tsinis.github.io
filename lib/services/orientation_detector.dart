import 'package:flutter/widgets.dart';

class OrientationSwitcher extends StatelessWidget {
  static const MainAxisSize _min = MainAxisSize.min;
  static const MainAxisAlignment _between = MainAxisAlignment.spaceBetween;

  final List<Widget> children;
  final bool rowIfWide;

  const OrientationSwitcher({
    required this.children,
    required this.rowIfWide,
    super.key,
  });

  @override
  Widget build(BuildContext context) => rowIfWide
      ? Row(mainAxisAlignment: _between, mainAxisSize: _min, children: children)
      : Column(
          mainAxisAlignment: _between,
          mainAxisSize: _min,
          children: children,
        );
}
