extension StringExtension on String {
  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';

  String get short =>
      // ignore: avoid-non-ascii-symbols, because it's correct symbol for ellipsis on UI.
      replaceAll(RegExp('[0-9]'), ' ').replaceAll(RegExp(r'\s+'), '…');
}
