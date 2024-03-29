import 'dart:math' show max;

// ignore: undefined_hidden_name
import 'package:flutter/material.dart' hide MenuItem;
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../extensions/context_extensions.dart';
import '../../extensions/navigation_menu_extensions.dart';
import '../../services/orientation_detector.dart';
import '../scroll_offset_builder.dart';
import 'navigation_menu_items.dart';

class NavigationMenu extends StatelessWidget {
  final double? height;
  final bool isWide;
  final AutoScrollController _scrollController;

  const NavigationMenu(
    this._scrollController, {
    this.isWide = false,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScrollOffsetBuilder(
        scrollController: _scrollController,
        builder: (_, offset) {
          final scaffold = Scaffold.of(context);

          return Opacity(
            // ignore: avoid-non-null-assertion, it's not a getter.
            opacity: height == null ? 1 : max(0, 1 - (offset / height!)),
            child: OrientationSwitcher(
              rowIfWide: isWide,
              children: [
                MenuItem(
                  menuItem: context.l10n.about,
                  onTap: () => Menu.about.scrollTo(scaffold, _scrollController),
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 8.5, minWidth: 30),
                ),
                MenuItem(
                  menuItem: context.l10n.portfolio,
                  onTap: () =>
                      Menu.portfolio.scrollTo(scaffold, _scrollController),
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 8.5, minWidth: 30),
                ),
                MenuItem(
                  menuItem: context.l10n.contacts,
                  onTap: () =>
                      Menu.contacts.scrollTo(scaffold, _scrollController),
                ),
              ],
            ),
          );
        },
      );
}
