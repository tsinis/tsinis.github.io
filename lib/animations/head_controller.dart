import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart' show ValueNotifier, Offset;

class HeadController implements FlareController {
  @override
  ValueNotifier<bool> isActive = ValueNotifier<bool>(false);

  bool _isHovering = false;
  bool _isPressed = false;
  late FlareAnimationLayer _exitAnimation;
  late FlareAnimationLayer _backgroundAnimation;
  late ActorNode? _eyesControl;
  late ActorNode? _headControl;
  Offset _pointer = Offset.zero;
  Mat2D _viewTransform = Mat2D();

  // ignore: avoid_setters_without_getters
  set move(Offset offset) => _pointer = offset;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_isHovering) {
      if (_isPressed) {
        if (_backgroundAnimation.time <
            _backgroundAnimation.animation.duration) {
          _backgroundAnimation
            ..time += elapsed
            ..apply(artboard);
        } else {
          _isPressed = false;
        }
      }

      if (_eyesControl == null) {
        return false;
      }

      final inverseViewTransform = Mat2D();
      if (!Mat2D.invert(inverseViewTransform, _viewTransform)) {
        return false;
      }

      final globalPointer = Vec2D();
      Vec2D.transformMat2D(
        globalPointer,
        Vec2D.fromValues(_pointer.dx, _pointer.dy),
        inverseViewTransform,
      );

      final inversePointerGlobal = Mat2D();
      if (!Mat2D.invert(
        inversePointerGlobal,
        _eyesControl!.parent!.worldTransform,
      )) {
        return false;
      }

      final pointerCoordinates = Vec2D();
      Vec2D.transformMat2D(
        pointerCoordinates,
        globalPointer,
        inversePointerGlobal,
      );

      _headControl?.translation =
          _eyesControl!.translation = pointerCoordinates;

      return true;
    } else {
      if (_exitAnimation.time < _exitAnimation.animation.duration) {
        _exitAnimation
          ..time += elapsed
          ..apply(artboard);
      }

      return true;
    }
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    isActive.value = true;
    final exitAnimation = artboard.getAnimation('exit');
    final backgroundAnimation = artboard.getAnimation('background');
    if (exitAnimation == null || backgroundAnimation == null) {
      return;
    }
    _eyesControl = artboard.getNode('eye_control');
    _headControl = artboard.getNode('head_control');
    _exitAnimation = FlareAnimationLayer(exitAnimation.name, exitAnimation)
      ..mixSeconds = 1
      ..mix = 1;
    _backgroundAnimation = FlareAnimationLayer(
      backgroundAnimation.name,
      backgroundAnimation,
    )..mix = 1;
  }

  @override
  void setViewTransform(Mat2D viewTransform) => _viewTransform = viewTransform;

  void changeHoverState(PointerEvent event) {
    if (event is PointerExitEvent) {
      _isHovering = false;
    } else {
      _exitAnimation.time = 0;
      _isHovering = true;
    }
  }

  void clicked() {
    _backgroundAnimation.time = 0;
    _isPressed = true;
  }
}
