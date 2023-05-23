import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this)!; // ignore: avoid-non-null-assertion
  MediaQueryData get media => MediaQuery.of(this);
  Size get screenSize => media.size;
}
