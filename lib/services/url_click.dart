import 'package:url_launcher/url_launcher.dart';

// ignore: avoid_classes_with_only_static_members
class Open {
  static const String fullEmailName = 'tsinis.job@gmail.com';
  static final Uri _mail = Uri(scheme: 'mailto', path: fullEmailName);

  static String get cvURL => 'tsinis.github.io/cv_tsinis.pdf';

  static Future<void> url(String url) async =>
      launchUrl(Uri.parse('https://$url'));

  static void openCvUrl() => url(cvURL);

  static Future<void> mail() async {
    if (await canLaunchUrl(Uri.parse(_mail.toString()))) {
      await launchUrl(Uri.parse(_mail.toString()));
    }
  }
}
