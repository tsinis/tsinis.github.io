import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../extensions/context_extensions.dart';
import '../services/animations_cache.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';
import '../widgets/circular_text.dart';
import '../widgets/navigation/adaptive_navigation_menu.dart';
import '../widgets/navigation/side_menu.dart';
import 'constants.dart';
import 'sections/header.dart';

class MyWeb extends StatelessWidget {
  final Artboard _artboard;

  const MyWeb(this._artboard, {super.key});

  @override
  Widget build(BuildContext context) => WidgetsApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        textStyle: MyTextStyles.bodyText1,
        color: MyColors.primaryColor,
        pageRouteBuilder: <Never>(_, __) => MaterialPageRoute(
          settings: _,
          builder: __,
        ),
        home: AnimationsCache(_artboard, child: _MyHomePage()),
      );
}

// ignore: prefer-single-widget-per-file
class _MyHomePage extends StatelessWidget {
  final _scrollController = AutoScrollController();

  // ignore: avoid-returning-widgets
  Iterable<Widget> get _taggedSections => List.generate(
        sections.length,
        (i) => AutoScrollTag(
          controller: _scrollController,
          index: i,
          key: ValueKey<int>(i),
          child: sections.elementAt(i),
        ),
        growable: false,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyColors.primaryColor,
        endDrawer: SideMenu(_scrollController),
        body: LayoutBuilder(
          builder: (_, size) {
            final height = size.maxHeight;

            return Stack(
              children: <Widget>[
                Header(
                  scrollController: _scrollController,
                  height: height,
                ),
                ListView(
                  cacheExtent: double.infinity,
                  controller: _scrollController,
                  children: <Widget>[
                    SizedBox(height: height),
                    ..._taggedSections,
                  ],
                ),
                if (height > size.maxWidth)
                  const SizedBox.shrink()
                else
                  Positioned(
                    left: 80,
                    bottom: 80,
                    child: RepaintBoundary(
                      child: CircularText(
                        textStyle: MyTextStyles.overline,
                        scrollController: _scrollController,
                      ),
                    ),
                  ),
                Positioned(
                  right: 0,
                  child: AdaptiveNavigationMenu(
                    scrollController: _scrollController,
                    size: size,
                  ),
                ),
              ],
            );
          },
        ),
      );
}
