import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rive/rive.dart';

import 'screens/main_page.dart';
import 'services/div_remover.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  DivRemover.removeFromHTML();
  WidgetsFlutterBinding.ensureInitialized();
  final riveFile = await RiveFile.asset('assets/images/avatar.riv');
  runApp(MyWeb(riveFile.mainArtboard));
}
