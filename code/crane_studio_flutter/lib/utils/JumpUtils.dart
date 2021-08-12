import 'package:url_launcher/url_launcher.dart';

class JumpUtils {
  static void openUrl(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {}
    } catch (e) {}
  }
}
