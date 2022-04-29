import 'dart:math' show max;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../extensions/context_extensions.dart';
import '../../generated/my_icons.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';

class MainText extends StatelessWidget {
  const MainText(this._offset, {Key? key}) : super(key: key);

  final double _offset;

  @override
  Widget build(BuildContext context) {
    final height = context.screenSize.height;
    final shortestSide = context.screenSize.shortestSide;
    return Column(
      children: <Widget>[
        SizedBox(height: shortestSide / 9 - ((height < 351) ? 22 : 0)),
        AutoSizeText(
          context.l10n.greeting,
          maxLines: 1,
          style: MyTextStyles.bodyText2.copyWith(color: MyColors.accentColor),
        ),
        SizedBox(height: shortestSide / 100),
        Container(
          margin: EdgeInsets.all(shortestSide / 20),
          child: Opacity(
            opacity: max(0, 0.6 - _offset / height),
            child: Text(
              context.l10n.devAndDesigner,
              textAlign: TextAlign.center,
              style: MyTextStyles.headline6.copyWith(
                height: 1.4,
                fontSize: shortestSide > 530
                    ? 60 + (shortestSide / 100)
                    : 40 - (shortestSide / 50),
              ),
            ),
          ),
        ),
        SizedBox(height: height / 4),
        const Icon(MyIcon.angle_double_down, color: MyColors.backgroundColor)
      ],
    );
  }
}
