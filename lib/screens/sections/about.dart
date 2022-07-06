import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../extensions/context_extensions.dart';
import '../../services/animations_cache.dart';
import '../../services/orientation_detector.dart';
import '../../themes/fonts.dart';
import '../../widgets/avatar_scene.dart';
import '../../widgets/cv_button.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = context.screenSize.width > 1020;

    return FractionallySizedBox(
      widthFactor: 0.9,
      alignment: Alignment.bottomCenter,
      child: OrientationSwitcher(
        rowIfWide: isWide,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
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
                      style: MyTextStyles.bodyText1.copyWith(height: 1.22),
                    ),
                  ),
                  const CVButton(),
                ],
              ),
            ),
          ),
          Flexible(child: AvatarScene(AnimationsCache.of(context)?.artboard)),
        ],
      ),
    );
  }
}
