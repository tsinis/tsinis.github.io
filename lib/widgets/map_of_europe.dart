import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import '../extensions/context_extensions.dart';
import '../themes/colors.dart';

class MapOfEurope extends StatelessWidget {
  static final MapController _controller = MapController(
    location: const LatLng(49.18, 16.56),
    zoom: 5,
  );

  const MapOfEurope({super.key});

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: MyColors.accentColor,
        child: Opacity(
          opacity: 0.5,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              MyColors.canvasColor,
              BlendMode.saturation,
            ),
            child: MapLayoutBuilder(
              controller: _controller,
              builder: (_, __) => TileLayer(
                builder: (_, x, y, z) {
                  final locale = context.l10n.currentLocale;
                  final url =
                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m2!1e0!2sh!3i420120484!3m1!2s$locale!5e1105!12m1!1e68!2m2!1sset!2sRoadmap!4e0!5m0!1e0!23i8289918';

                  return CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
        ),
      );
}
