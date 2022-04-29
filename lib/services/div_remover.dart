// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

// ignore: avoid_classes_with_only_static_members
class DivRemover {
  static void removeFromHTML() {
    final loader = document.getElementsByClassName('loader');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }
  }
}
