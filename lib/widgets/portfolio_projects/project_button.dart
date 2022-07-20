import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';
import '../../extensions/regular_expressions.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../themes/button_style.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';

class ProjectButton extends ButtonBar {
  final bool isWide;
  final String url;

  bool get _openSource => url.toLowerCase().contains('github');

  const ProjectButton(this.url, {this.isWide = true, super.key});

  @override
  Widget build(BuildContext context) {
    final isSmartWatch = context.screenSize.width < 321;

    return Tooltip(
      textStyle: MyTextStyles.caption,
      message: url.short,
      // ignore: avoid-wrapping-in-padding
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: MaterialButton(
          shape: MyButtons.shape,
          height: 52,
          color: _openSource
              ? MyColors.contrastColorLight
              : const Color.fromARGB(255, 10, 132, 255),
          elevation: 1.5,
          hoverElevation: 2.5,
          highlightElevation: 3,
          onPressed: () => unawaited(Open.url(url)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _openSource
                ? <Widget>[
                    if (isSmartWatch)
                      const SizedBox.shrink()
                    else
                      const Icon(MyIcon.github),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 8,
                        maxWidth: 12,
                      ),
                    ),
                    AutoSizeText(
                      (isWide ? context.l10n.moreInfo : context.l10n.theCode)
                          .capitalizeFirstLetter,
                      maxLines: 1,
                      style: MyTextStyles.button,
                    ),
                  ]
                : <Widget>[
                    if (isSmartWatch)
                      const SizedBox.shrink()
                    else
                      const Icon(
                        MyIcon.app_store_ios,
                        color: MyColors.contrastColorLight,
                      ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 10,
                        maxWidth: 15,
                      ),
                    ),
                    AutoSizeText(
                      isWide ? 'App Store' : 'Store',
                      maxLines: 1,
                      style: MyTextStyles.button.copyWith(
                        color: MyColors.contrastColorLight,
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
