import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../generated/my_icons.dart';
import '../../themes/colors.dart';
import 'navigation_menu_list.dart';

class SideMenu extends Drawer {
  final AutoScrollController _scrollController;
  const SideMenu(this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Drawer(
            child: ColoredBox(
              color: MyColors.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      icon: const Icon(MyIcon.arrow_left),
                      color: MyColors.accentColor,
                      onPressed: Scaffold.of(context).openDrawer,
                    ),
                  ),
                  NavigationMenu(_scrollController),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
