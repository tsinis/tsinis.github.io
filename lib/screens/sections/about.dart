import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../extensions/context_extensions.dart';
import '../../services/orientation_detector.dart';
import '../../themes/fonts.dart';
import '../../widgets/avatar.dart';
import '../../widgets/cv_button.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = context.screenSize.width > 1023.9;

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: OrientationSwitcher(
        rowIfWide: isWide,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  context.l10n.fullName,
                  maxLines: 1,
                  style: MyTextStyles.headline4.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: AutoSizeText(
                    context.l10n.iAm,
                    maxLines: isWide ? 8 : 16,
                    strutStyle: const StrutStyle(height: 1.25),
                    style: MyTextStyles.bodyText1.copyWith(height: 1.2),
                  ),
                ),
                const CVButton(),
              ],
            ),
          ),
          SizedBox(
            width: context.screenSize.shortestSide * 0.6,
            height: context.screenSize.shortestSide * 0.6,
            child: const Avatar(),
          ),
        ],
      ),
    );
  }
}
