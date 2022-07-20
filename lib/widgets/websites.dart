import 'dart:async';

import 'package:flutter/material.dart';

import '../generated/my_icons.dart';
import '../services/url_click.dart';
import '../themes/button_style.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class Websites extends StatelessWidget {
  static const Map<String, MapEntry<IconData, Color>> _websites = {
    'LinkedIn.com/in/': MapEntry(MyIcon.linkedin, Color(0xFF2867B2)),
    'GitHub.com/': MapEntry(MyIcon.github_square, Color(0xFF24292e)),
    'Dribbble.com/': MapEntry(MyIcon.dribbble_square, Color(0xFFea4c89)),
    'Medium.com/@': MapEntry(MyIcon.medium, MyColors.contrastColorDark),
    'Vimeo.com/': MapEntry(MyIcon.vimeo_square, Color(0xFF1ab7ea)),
    'Telegram.me/': MapEntry(MyIcon.telegram, Color(0xFF0088cc)),
    'Flare.rive.app/a/': MapEntry(MyIcon.rive, MyColors.contrastColorLight),
  };

  const Websites({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: _websites.entries
            .map<_WebsiteButton>(
              (webSiteData) => _WebsiteButton(
                url: webSiteData.key,
                icon: webSiteData.value.key,
                color: webSiteData.value.value,
              ),
            )
            .toList(growable: false),
      );
}

// ignore: prefer-single-widget-per-file
class _WebsiteButton extends StatelessWidget {
  final String url;
  final IconData icon;
  final Color color;

  String get _fullURL => '${url.toLowerCase()}tsinis';

  const _WebsiteButton({
    required this.url,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Tooltip(
        textStyle: MyTextStyles.caption,
        preferBelow: false,
        message: _fullURL,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 156,
            child: MaterialButton(
              shape: MyButtons.shape,
              height: 46,
              color: const Color(0x7EE0E0E0),
              textColor: MyColors.disabledColor,
              hoverColor: color.withOpacity(0.25),
              highlightColor: color.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: color),
                  const SizedBox(width: 8),
                  Text(
                    url.substring(0, url.indexOf('.')),
                    style: MyTextStyles.overline.copyWith(
                      fontSize: 18,
                      letterSpacing: 0.33,
                      fontWeight: FontWeight.w400,
                      color: MyColors.primaryColorDark,
                    ),
                  ),
                ],
              ),
              onPressed: () => unawaited(Open.url(_fullURL)),
            ),
          ),
        ),
      );
}
