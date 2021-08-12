import 'dart:io';

import 'package:crane_studio_flutter/utils/ConfigUtils.dart';
import 'package:crane_studio_flutter/utils/platform_utils.dart';

class K {
  static var IS_GOOGLEPLAY = true;

  static const IOS_APPID = '1564193574';
  static const ANDROID_PACKAGE = 'cn.crane.flutter.minesweeper';
  static const IOS_PACKAGE = 'cn.crane.flutter.minesweeper';

  static var _channel = '';

  static setChannel(String channel) {
    K._channel = channel;
    IS_GOOGLEPLAY = channel != null && channel.contains('google');
  }

  static getChannel() {
    return _channel;
  }

  static init(bool is_googleplay) {
    IS_GOOGLEPLAY = is_googleplay;
  }

  static String getPackage() {
    try {
      return Platform.isIOS ? IOS_PACKAGE : ANDROID_PACKAGE;
    } catch (e) {
      return '';
    }
  }

  static String getMoreListLocal() {
    if (PlatformUtils.isAndroid()) {
      if (IS_GOOGLEPLAY) {
        return 'assets/json/more_apps_google_play.json';
      } else {
        return 'assets/json/more_apps.json';
      }
    } else {
      if (ConfigUtils.isChinese()) {
        return 'assets/json/more_apps_ios_zh.json';
      } else {
        return 'assets/json/more_apps_ios.json';
      }
    }
  }

  static String getMoreListUrl() {
    if (PlatformUtils.isAndroid()) {
      if (IS_GOOGLEPLAY) {
        return 'https://configs-1253122004.cos.ap-chengdu.myqcloud.com/more_apps_google_play.json';
      } else {
        return 'https://configs-1253122004.cos.ap-chengdu.myqcloud.com/more_apps.json';
      }
    } else {
      if (ConfigUtils.isChinese()) {
        return 'https://configs-1253122004.cos.ap-chengdu.myqcloud.com/more_apps_ios_zh.json';
      } else {
        return 'https://configs-1253122004.cos.ap-chengdu.myqcloud.com/more_apps_ios.json';
      }
    }
  }

  static Uri getMoreListUrlForHttp() {
    String unencodedPath = '';
    if (PlatformUtils.isAndroid()) {
      if (IS_GOOGLEPLAY) {
        unencodedPath = '/more_apps_google_play.json';
      } else {
        unencodedPath = '/more_apps.json';
      }
    } else {
      if (ConfigUtils.isChinese()) {
        unencodedPath = '/more_apps_ios_zh.json';
      } else {
        unencodedPath = '/more_apps_ios.json';
      }
    }
    return Uri.https(
        'configs-1253122004.cos.ap-chengdu.myqcloud.com', unencodedPath, {});
  }

  static String getRateUrl() {
    if (PlatformUtils.isIOS()) {
      return 'itms-apps://itunes.apple.com/app/id${IOS_APPID}?action=write-review';
    } else {
      if (IS_GOOGLEPLAY) {
        return 'https://play.google.com/store/apps/details?id=${ANDROID_PACKAGE}';
      } else {
        return 'https://www.coolapk.com/game/${ANDROID_PACKAGE}';
      }
    }
  }
}
