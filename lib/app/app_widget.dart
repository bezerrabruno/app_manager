import 'package:app_manager/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: AppTheme.lightTheme(),
      home: const HomePage(),
    );
  }
}
