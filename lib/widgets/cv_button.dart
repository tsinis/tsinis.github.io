import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../generated/my_icons.dart';
import '../services/url_click.dart';
import '../themes/button_style.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

// ignore: deprecated_member_use, TODO!
class CVButton extends ButtonBar {
  const CVButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenSize.width;
    final isSmartWatch = width < 300;

    return Tooltip(
      textStyle: MyTextStyles.caption,
      preferBelow: width > 1439,
      message: Open.cvURL,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 5),
        colorBrightness: Brightness.light,
        shape: MyButtons.shape,
        height: 52,
        minWidth: 300,
        color: MyColors.primaryColorLight,
        elevation: 2,
        hoverElevation: 4,
        highlightElevation: 6,
        onPressed: Open.openCvUrl,
        child: Row(
          mainAxisSize: isSmartWatch ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isSmartWatch)
              const SizedBox.shrink()
            else
              const Icon(
                MyIcon.file_pdf,
                color: Colors.redAccent,
              ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 10,
                maxWidth: 15,
              ),
            ),
            AutoSizeText(
              context.l10n.cv,
              maxLines: 1,
              style: MyTextStyles.button,
            ),
          ],
        ),
      ),
    );
  }
}
