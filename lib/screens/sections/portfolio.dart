import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../extensions/context_extensions.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/portfolio_projects/portfolio_project.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.screenSize.height;
    final width = context.screenSize.width;

    return ColoredBox(
      color: MyColors.backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: height * 0.1, width: 0),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AutoSizeText(
                context.l10n.portfolio,
                maxLines: 1,
                style: MyTextStyles.headline4.copyWith(
                  color: MyColors.primaryColorDark,
                ),
              ),
            ),
            SizedBox(height: height * 0.05, width: 0),
            AutoSizeText.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '''${context.l10n.findInPortfolio} ${context.l10n.somePortfolio} ''',
                    style: MyTextStyles.bodyText2,
                  ),
                  TextSpan(
                    text: context.l10n.projectsPortfolio,
                    style: MyTextStyles.bodyText2.copyWith(
                      color: MyColors.primaryColorLight,
                    ),
                  ),
                ],
              ),
              maxLines: 6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.025, width: 0),
            Wrap(
              spacing: width * 0.025,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Project(
                  projectName: 'Colors AI',
                  pathToImage: 'assets/images/projects/colors.jpg',
                  projectDesc: context.l10n.colorsAiDesc,
                  appURL: 'github.com/tsinis/colors_ai',
                ),
                Project(
                  projectName: context.l10n.planetBGame,
                  pathToImage: 'assets/images/projects/planet.jpg',
                  projectDesc: context.l10n.planetBGameDesc,
                  appURL: 'github.com/tsinis/plan_et_b',
                ),
              ],
            ),
            Wrap(
              spacing: width * 0.025,
              children: [
                Project(
                  projectName: 'Steampunk Flutter Clock',
                  pathToImage: 'assets/images/projects/clock.jpg',
                  projectDesc: context.l10n.flutterClock,
                  appURL: 'github.com/tsinis/flutter_clock',
                ),
                Project(
                  projectName: 'IKEM Online',
                  pathToImage: 'assets/images/projects/ikem.jpg',
                  projectDesc: context.l10n.ikem,
                  appURL: 'apps.apple.com/us/app/ikem-online/id1566017692',
                ),
              ],
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
