import 'package:app_manager/app/app_widget.dart';
import 'package:app_manager/app/core/utils/widow_config_util.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await lazeInit();

  runApp(const AppWidget());
}

Future<void> lazeInit() async {
  await windowManager.ensureInitialized();

  WidowConfigUtil.widowsConfig();
}
