import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class AnimationsCache extends InheritedWidget {
  static AnimationsCache? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AnimationsCache>();

  final Artboard artboard;

  const AnimationsCache(this.artboard, {required super.child, super.key});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  Widget build(BuildContext _) => child;
}
