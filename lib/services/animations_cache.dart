import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class AnimationsCache extends InheritedWidget {
  final Artboard artboard;

  const AnimationsCache({
    required this.artboard,
    required super.child,
    super.key,
  });

  Widget build(BuildContext _) => child;

  static AnimationsCache? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AnimationsCache>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
