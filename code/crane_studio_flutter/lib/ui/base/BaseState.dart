import 'dart:async';
import 'dart:math' as math;

import 'package:crane_studio_flutter/utils/ConfigUtils.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  bool isResumed = false;

  double sW = 0;
  double sH = 0;
  Size? screenSize;

  Timer? timerBase;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    screenSize = ConfigUtils.screenSize;
    computeScreenHW();

    timerBase = new Timer(const Duration(milliseconds: 100), () {
      setState(() {
        screenSize = MediaQuery.of(context).size;
        ConfigUtils.screenSize = screenSize;
        computeScreenHW();
        // ThemeType.setBrightness(
        //     WidgetsBinding.instance.window.platformBrightness);
      });
    });
  }

  void computeScreenHW() {
    if (screenSize != null) {
      double h = screenSize!.height;
      double w = screenSize!.width;
      if (ConfigUtils.isScreenH) {
        sH = math.min(h, w);
        sW = math.max(h, w);
      } else {
        sH = math.max(h, w);
        sW = math.min(h, w);
      }
    }
  }

  dispose() {
    timerBase?.cancel();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState ${runtimeType} : $state');
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPause();
    }
  }

  @override
  void didChangePlatformBrightness() {
    // ThemeType.setBrightness(WidgetsBinding.instance.window.platformBrightness);
    // setState(() {});
  }

  double getPaddingTop() => MediaQuery.of(context).padding.top;

  double getPaddingBottom() => MediaQuery.of(context).padding.bottom;

  double getPaddingRight() => MediaQuery.of(context).padding.right;

  void onResume() {
    isResumed = true;
    // TrackUtils.onResume(getPageName());

    print('base state onresume');
  }

  void onPause() {
    isResumed = false;
    // TrackUtils.onPause(getPageName());
  }

  String getPageName() {
    return runtimeType.toString();
  }
}
