import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum Menu { about, portfolio, contacts }

extension MenuExtension on Menu {
  void scrollTo(
    ScaffoldState? scaffold,
    AutoScrollController scrollController,
  ) {
    unawaited(
      scrollController.scrollToIndex(
        index,
        duration: const Duration(seconds: 2),
        preferPosition: this == Menu.contacts
            ? AutoScrollPosition.middle
            : AutoScrollPosition.begin,
      ),
    );
    scaffold?.openDrawer();
  }
}
