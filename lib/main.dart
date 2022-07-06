import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'animations/rive_avatar.dart';
import 'screens/main_page.dart';
import 'services/div_remover.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  DivRemover.removeFromHTML();
  WidgetsFlutterBinding.ensureInitialized();
  final cachedAnimation = await RiveAvatar.cachedAnimation;

  /// To find proper artboard there is also animationsCache?.artboards list,
  /// or animationsCache?.artboardByName('artboard_name') method.
  runApp(MyWeb(cachedAnimation.mainArtboard));
}
