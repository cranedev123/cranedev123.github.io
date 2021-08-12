import 'dart:io';

class PlatformUtils {
  static bool isPc() {
    return !isAndroid() && !isIOS();
  }

  static bool isAndroid() {
    try {
      return Platform.isAndroid;
    } catch (e) {}
    return false;
  }

  static bool isIOS() {
    try {
      return Platform.isIOS;
    } catch (e) {}
    return false;
  }
}
