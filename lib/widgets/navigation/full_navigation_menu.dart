import 'package:flutter/widgets.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../extensions/context_extensions.dart';
import 'navigation_menu_list.dart';

class FullNavigationMenu extends StatelessWidget {
  final AutoScrollController _scrollController;

  const FullNavigationMenu(this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return size.width > 639
        ? NavigationMenu(_scrollController, isWide: true, height: size.height)
        : const SizedBox.shrink();
  }
}
