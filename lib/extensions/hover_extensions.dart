import 'package:flutter/widgets.dart';

import '../animations/color_on_hover.dart';
import '../animations/translate_on_hover.dart';
import '../animations/zoom_on_hover.dart';

extension HoverExtensions on Widget? {
  Widget moveUpOnHover() => TranslateOnHover(child: this);
  Widget zoomInOnHover({bool isExpanded = false}) => ZoomOnHover(
        isExpanded: isExpanded,
        child: this,
      );
  Widget colorOnHover({bool isExpanded = false}) => ColorOnHover(
        isExpanded: isExpanded,
        child: this,
      );
}
