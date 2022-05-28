import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/my_icons.dart';
import '../../themes/colors.dart';
import '../navigation/full_navigation_menu.dart';
import '../scroll_offset_builder.dart';

class AdaptiveNavigationMenu extends StatelessWidget {
  final BoxConstraints _size;
  final AutoScrollController _scrollController;

  const AdaptiveNavigationMenu({
    required AutoScrollController scrollController,
    required BoxConstraints size,
    super.key,
  })  : _scrollController = scrollController,
        _size = size;

  @override
  Widget build(BuildContext context) => ScrollOffsetBuilder(
        scrollController: _scrollController,
        builder: (_, offset) {
          final isSmartPhone =
              _size.maxWidth < 646.5 || offset >= _size.maxHeight;

          return Padding(
            padding: EdgeInsets.only(top: 30, right: isSmartPhone ? 20 : 50),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              reverseDuration: Duration.zero,
              child: isSmartPhone
                  ? IconButton(
                      icon: const Icon(MyIcon.menu),
                      color: MyColors.accentColor,
                      onPressed: Scaffold.of(context).openEndDrawer,
                    ).moveUpOnHover()
                  : FullNavigationMenu(_scrollController),
            ),
          );
        },
      );
}
