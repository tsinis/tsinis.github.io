import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/my_icons.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import 'project_button.dart';

class Project extends StatefulWidget {
  final String appURL;
  final String pathToImage;
  final String projectDesc;
  final String projectName;

  const Project({
    required this.projectName,
    required this.projectDesc,
    required this.pathToImage,
    required this.appURL,
    super.key,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final ExpandableController controller = ExpandableController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenSize.width;

    return GestureDetector(
      onTap: () => setState(controller.toggle),
      child: SizedBox(
        width: (width > 1023) ? width / 3 : width,
        child: Card(
          color: MyColors.primaryColorLight,
          borderOnForeground: false,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          margin: const EdgeInsets.only(top: 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ExpandableNotifier(
            controller: controller,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  borderOnForeground: false,
                  clipBehavior: Clip.hardEdge,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: const RoundedRectangleBorder(),
                  child: Image.asset(widget.pathToImage)
                      .zoomInOnHover(isExpanded: controller.expanded)
                      .colorOnHover(isExpanded: controller.expanded),
                ),
                ExpandablePanel(
                  collapsed: const SizedBox(),
                  controller: controller,
                  theme: const ExpandableThemeData(
                    iconColor: MyColors.accentColor,
                    iconPadding: EdgeInsets.symmetric(horizontal: 15),
                    iconSize: 18,
                    fadeCurve: Curves.fastOutSlowIn,
                    sizeCurve: Curves.easeInToLinear,
                    expandIcon: MyIcon.caret_down,
                    collapseIcon: MyIcon.caret_up,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: false,
                    tapHeaderToExpand: false,
                    useInkWell: false,
                  ),
                  header: SizedBox(
                    height: 35,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text(
                          widget.projectName,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: MyTextStyles.bodyText2,
                        ),
                      ),
                    ),
                  ),
                  expanded: Column(
                    children: [
                      const SizedBox(height: 10),
                      FractionallySizedBox(
                        widthFactor: 0.85,
                        child: AutoSizeText(
                          widget.projectDesc,
                          textAlign: TextAlign.justify,
                          maxLines: 8,
                          maxFontSize: 20,
                          softWrap: true,
                          style: MyTextStyles.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:
                            ProjectButton(widget.appURL, isWide: width > 399),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
