import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/gestures.dart' show PointerHoverEvent;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../animations/head_controller.dart';

class Avatar extends StatelessWidget {
  static final AssetProvider _cache =
      AssetFlare(bundle: rootBundle, name: 'assets/images/avatar.flr');

  static final HeadController _headController = HeadController();

  AssetProvider get cache => _cache;

  const Avatar({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _headController.clicked,
        child: MouseRegion(
          onExit: _headController.changeHoverState,
          onEnter: _headController.changeHoverState,
          onHover: _pointerHover,
          child: FlareActor.asset(
            _cache,
            controller: _headController,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
            animation: 'blink',
          ),
        ),
      );

  void _pointerHover(PointerHoverEvent pointer) =>
      _headController.move = Offset(
        pointer.position.dx,
        pointer.localPosition.dy,
      );
}
