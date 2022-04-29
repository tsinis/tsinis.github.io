import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../animations/brno_on_map.dart';
import '../../extensions/context_extensions.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/map_of_europe.dart';
import '../../widgets/websites.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return ColoredBox(
      color: MyColors.primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRect(
            //WORKAROUND FOR BLENDING MODE AT 1.26.0-2.0.pre.167.
            child: SizedBox(
              width: max(size.width, 400),
              height: max(
                size.height / ((size.width > size.height) ? 1.6 : 1.2),
                (size.width > size.height) ? 500 : 1200,
              ),
              child: const MapOfEurope(),
            ),
          ),
          const Brno(),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                AutoSizeText(
                  context.l10n.contacts,
                  maxLines: 1,
                  style: MyTextStyles.headline4,
                ),
                SizedBox(height: size.height * 0.05),
                AutoSizeText(
                  context.l10n.contactsDesc,
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  style: MyTextStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w400,
                    color: MyColors.contrastColorLight,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                const Websites(),
                SizedBox(height: size.height * 0.02),
                Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      context.l10n.email,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: MyTextStyles.bodyText2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyColors.contrastColorLight,
                      ),
                    ),
                    Tooltip(
                      preferBelow: false,
                      message: Open.fullEmailName,
                      textStyle: MyTextStyles.caption,
                      child: const IconButton(
                        onPressed: Open.mail,
                        icon: Icon(
                          MyIcon.mail_alt,
                          color: MyColors.contrastColorLight,
                        ),
                      ).moveUpOnHover(),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.025),
              ],
            ),
          )
        ],
      ),
    );
  }
}
