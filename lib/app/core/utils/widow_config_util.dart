import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WidowConfigUtil {
  static void widowsConfig() {
    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 800),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
