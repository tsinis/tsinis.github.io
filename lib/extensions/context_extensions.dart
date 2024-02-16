import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  // ignore: avoid-non-null-assertion
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  MediaQueryData get media => MediaQuery.of(this);
  Size get screenSize => media.size;
}
