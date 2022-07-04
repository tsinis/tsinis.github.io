import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../animations/avatar.dart';

/// A scene with an avatar from which tap/cursor position data is taken.
class AvatarScene extends StatelessWidget {
  /// Artboard dimension data, for pixel-perfect coordinate mapping.
  final double artboardHeight;
  final double artboardWidth;

  /// Non-required parameter to set the background color, suitable for
  /// animations with transparent background that can be colored this way.
  final Color backgroundColor;

  /// [RiveSceneController] for controlling the [RiveScene].
  final Avatar _scene;

  const AvatarScene(
    this._scene, {
    required this.artboardHeight,
    required this.artboardWidth,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: backgroundColor,
        child: FittedBox(
          child: SizedBox(
            width: artboardWidth,
            height: artboardHeight,
            child: GestureDetector(
              onTapDown: _scene.onTapDown,
              child: MouseRegion(
                onEnter: _scene.changeHoverState,
                onExit: _scene.changeHoverState,
                onHover: (pointer) => _scene.move = pointer.localPosition,
                child: RiveScene(controller: _scene),
              ),
            ),
          ),
        ),
      );
}
