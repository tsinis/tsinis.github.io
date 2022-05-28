import 'package:flutter/widgets.dart';

import '../../extensions/hover_extensions.dart';
import '../../themes/fonts.dart';

class MenuItem extends GestureDetector {
  MenuItem({
    required String menuItem,
    required void Function() onTap,
    super.key,
  }) : super(
          onTap: onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              menuItem,
              style: MyTextStyles.bodyText1,
            ).moveUpOnHover(),
          ),
        );
}
