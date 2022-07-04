import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:rive/components.dart';
import 'package:rive/math.dart';
import 'package:rive/rive.dart';

class Avatar extends RiveSceneController with ChangeNotifier {
  /// The main artboard from which animations, context, etc. will be taken.
  final Artboard _artboard;

  /// Animations block, names are coming from rive.app editor.
  late final _background = _artboard.animationByName('background')!;
  late final _blink = _artboard.animationByName('blink');
  late final _exit = _artboard.animationByName('exit')!;

  /// Nodes block, names are also coming from rive.app editor, type
  /// is mandatory, since the component method can return different components.
  late final _eyes = _artboard.component<Node>('eye_control')!;
  late final _head = _artboard.component<Node>('head_control');

  /// Dimensional and coordinate calculation helpers block.
  final _inverseViewTransform = Mat2D();
  final _viewTransform = Mat2D();

  /// Variables for state storing/managing.
  var _pointer = Offset.zero;
  var _isHovering = false;

  @override
  ChangeNotifier get redraw => this; // Required by [RiveSceneController].

  @override
  Size get size => Size(_artboard.width, _artboard.height); // Also required.

  /// Interface for eyes/head moving via pointer hovering.
  set move(Offset pointerOffset) => _pointer = pointerOffset;

  /// Since background's animation time during initialization will be 0,
  Avatar(Artboard artboard) : _artboard = artboard {
    /// increase it to the maximum, so it won't play after at startup.
    _background.time = _background.animation.endTime + 1;
  }

  @override
  bool advance(double elapsedSeconds) {
    /// Blink/breath animation will run in loop.
    if (_blink?.isDone ?? false) _blink?.reset();
    _blink?.applySeconds(elapsedSeconds, _artboard.context);

    /// Background animation will only play on demand (on tap).
    if (!_background.isDone) {
      _background.applySeconds(elapsedSeconds, _artboard.context);
    }

    /// So if there is pointer hovering above the avatar:
    if (_isHovering) {
      /// Get the pointer into scene space.
      final pointer = Vec2D.transformMat2D(
        Vec2D(),
        Vec2D.fromValues(
          _pointer.dx - _artboard.width / 2,
          _pointer.dy - _artboard.height / 2,
        ),
        _inverseViewTransform,
      );

      /// Place the targets at the pointer.
      /// Get the parent world transform of the target "eye_control" node.
      final inverseTargetWorld = Mat2D();
      if (Mat2D.invert(inverseTargetWorld, _eyes.parentWorldTransform)) {
        _head?.translation = _eyes.translation = Vec2D.transformMat2D(
          Vec2D(),
          Vec2D.fromValues(pointer.x, pointer.y),
          inverseTargetWorld,
        );
      }
    } else {
      /// Otherwise play "exit" animation (if not running already).
      if (!_exit.isDone) _exit.applySeconds(elapsedSeconds, _artboard.context);
    }

    /// Update all those things after all.
    _artboard.advance(elapsedSeconds);

    return true;
  }

  @override
  void draw(Canvas canvas, Mat2D viewTransform) {
    /// Make a copy of it so advance can use the latest view transform.
    if (!Mat2D.areEqual(_viewTransform, viewTransform)) {
      Mat2D.copy(_viewTransform, viewTransform);
      Mat2D.invert(_inverseViewTransform, _viewTransform);
    }

    /// Then just draw artboard on canvas.
    _artboard.draw(canvas);
  }

  /// Detect what kind of pointer event is coming from device
  /// and reset "exit" animation so it will play on next [PointerExitEvent].
  void changeHoverState(PointerEvent event) {
    _isHovering = event is PointerEnterEvent;
    if (_isHovering) _exit.reset();
  }

  /// If there was a tap/click on avatar, play background animation,
  /// and if it was touch input, move eyes/head to follow it and
  /// reset it after one second with "exit" animation.
  void onTapDown(TapDownDetails details) {
    _background.reset();
    if (details.kind != PointerDeviceKind.touch) return;
    _isHovering = true;
    _pointer = details.localPosition;
    Future.delayed(const Duration(seconds: 1), () {
      _isHovering = false;
      _exit.reset();
    });
  }
}

/// Few useful shorthands/shortcuts, following the DRY principle.
extension LinearAnimationInstanceX on LinearAnimationInstance {
  bool get isDone => time >= animation.endTime;
  void applySeconds(double elapsedSeconds, RuntimeArtboard context) => this
    ..time += elapsedSeconds
    ..apply(context);
}
