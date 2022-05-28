import 'package:url_launcher/url_launcher.dart';

// ignore: avoid_classes_with_only_static_members
class Open {
  static const String fullEmailName = 'tsinis.job@gmail.com';
  static final Uri _mail = Uri(scheme: 'mailto', path: fullEmailName);

  static String get cvURL => 'tsin.is/cv_tsinis.pdf';

  static Future<void> url(String url) async =>
      launchUrl(Uri.parse('https://$url'));

  static void openCvUrl() => url(cvURL);

  static Future<void> mail() async {
    final mail = Uri.parse(_mail.toString());
    if (await canLaunchUrl(mail)) {
      await launchUrl(mail);
    }
  }
}
