import 'package:flutter/widgets.dart';

extension ScrollExtensions on ScrollController {
  double get clientOffset => hasClients ? offset : 0.0;
}
