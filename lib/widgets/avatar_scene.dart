import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../animations/rive_avatar.dart';

/// A scene with an avatar from which tap/cursor position data is taken.
class AvatarScene extends StatelessWidget {
  /// Non-required parameter to set the background color, suitable for
  /// animations with transparent background that can be colored this way.
  final Color backgroundColor;

  /// All interactive avatar logic is managed there, controller-like.
  final RiveAvatar _avatar;

  AvatarScene(
    Artboard? cachedArtboard, {
    this.backgroundColor = Colors.transparent,
    super.key,
  }) : _avatar = RiveAvatar(cachedArtboard);

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: backgroundColor,
        child: FittedBox(
          child: GestureDetector(
            onTapDown: _avatar.onTapDown,
            child: MouseRegion(
              onExit: (_) => _avatar.onExit(),
              onHover: (event) => _avatar.move(event.localPosition),
              // The useArtboardSize is important for accurate pointer position.
              child: RepaintBoundary(
                child: Rive(
                  artboard: _avatar.artboard,
                  useArtboardSize: true,
                ),
              ),
            ),
          ),
        ),
      );
}
