extension StringExtension on String {
  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';

  String get short => replaceAll(RegExp('[0-9]'), ' ').replaceAll(RegExp(r'\s+'), '…');
}
