import 'package:flutter/material.dart';

import '../../generated/my_icons.dart';

const _footerTextStyle = TextStyle(fontFamily: 'Roboto', fontSize: 12);

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFFFD54F)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const <Widget>[
              Text(
                // ignore: avoid-non-ascii-symbols
                'All rights reserved — ©2022 Roman Cinis.',
                textAlign: TextAlign.center,
                style: _footerTextStyle,
              ),
              SizedBox(width: 5),
              Text(
                '(Font: Hagrid Family by Zetafonts -http://www.zetafonts.com/collection/3760).',
                textAlign: TextAlign.center,
                style: _footerTextStyle,
              ),
              Text(
                ' Made with ',
                strutStyle: StrutStyle(forceStrutHeight: true),
                textAlign: TextAlign.center,
                style: _footerTextStyle,
              ),
              Icon(MyIcon.heart, color: Colors.blue, size: 13),
              Text(
                ' in ',
                strutStyle: StrutStyle(forceStrutHeight: true),
                textAlign: TextAlign.center,
                style: _footerTextStyle,
              ),
              FlutterLogo(size: 14),
            ],
          ),
        ),
      );
}
