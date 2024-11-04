import 'package:app_manager/app/core/theme/app_theme.dart';
import 'package:app_manager/app/modules/home/controller/home_controller.dart';
import 'package:app_manager/app/modules/home/page/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: AppTheme.theme(),
      home: HomePage(
        controller: HomeController(),
      ),
    );
  }
}
