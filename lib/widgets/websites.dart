import 'package:flutter/material.dart';

import '../generated/my_icons.dart';
import '../services/url_click.dart';
import '../themes/button_style.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class Websites extends StatelessWidget {
  const Websites({Key? key}) : super(key: key);

  static const Map<String, MapEntry<IconData, Color>> _websites = {
    'LinkedIn.com/in/': MapEntry(MyIcon.linkedin, Color(0xFF2867B2)),
    'GitHub.com/': MapEntry(MyIcon.github_square, Color(0xFF24292e)),
    'Dribbble.com/': MapEntry(MyIcon.dribbble_square, Color(0xFFea4c89)),
    'Medium.com/@': MapEntry(MyIcon.medium, MyColors.contrastColorDark),
    // 'Codepen.io/': MapEntry(MyIcon.codepen, Color(0xFF333333)),
    'Vimeo.com/': MapEntry(MyIcon.vimeo_square, Color(0xFF1ab7ea)),
    'Telegram.me/': MapEntry(MyIcon.telegram, Color(0xFF0088cc)),
    'Flare.rive.app/a/': MapEntry(MyIcon.rive, MyColors.contrastColorLight)
  };

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

class _WebsiteButton extends StatelessWidget {
  const _WebsiteButton({
    required this.url,
    required this.icon,
    required this.color,
  });
  final String url;
  final IconData icon;
  final Color color;

  String get fullURL => '${url.toLowerCase()}tsinis';

  @override
  Widget build(BuildContext context) => Tooltip(
        textStyle: MyTextStyles.caption,
        preferBelow: false,
        message: fullURL,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 156,
            // ignore: deprecated_member_use
            child: FlatButton.icon(
              shape: MyButtons.shape,
              height: 46,
              color: const Color(0x7EE0E0E0),
              textColor: MyColors.disabledColor,
              hoverColor: color.withOpacity(0.25),
              highlightColor: color.withOpacity(0.5),
              icon: Icon(icon, color: color),
              label: Text(
                url.substring(0, url.indexOf('.')),
                style: MyTextStyles.overline.copyWith(
                  fontSize: 18,
                  letterSpacing: 0.33,
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryColorDark,
                ),
              ),
              onPressed: () => Open.url(fullURL),
            ),
          ),
        ),
      );
}
