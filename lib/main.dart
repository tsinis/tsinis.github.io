import 'dart:async' show unawaited;

import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'screens/main_page.dart';
import 'services/div_remover.dart';
import 'widgets/avatar.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  DivRemover.removeFromHTML();
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  unawaited(cachedActor(const Avatar().cache));
  runApp(const MyWeb());
}
