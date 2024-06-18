import 'dart:convert';
import 'dart:io';

import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/domain/entities/config_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:process_run/shell.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class HomeController extends ChangeNotifier {
  /// Vars
  late final String _localPath;
  late final AnimationController animationController;

  final List<ConfigEntity> config = [];

  PageStateEnum _pageState = PageStateEnum.load;

  /// Uses
  PageStateEnum get pageState => _pageState;

  Future<void> init(TickerProvider vsync) async {
    try {
      _pageState = PageStateEnum.load;
      notifyListeners();

      animationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: vsync,
      );

      _localPath = 'C:\\Dev\\app_manager';

      File jsonsPath = File('$_localPath\\config.json');

      String jsonsString = await jsonsPath.readAsString();

      final configJson = jsonDecode(jsonsString);

      if ((configJson['tabs'] as List).isEmpty) {
        _pageState = PageStateEnum.empty;
      }

      for (final item in configJson['tabs']) {
        config.add(ConfigEntity.fromMap(item));
      }

      _pageState = PageStateEnum.success;
    } catch (_) {
      _pageState = PageStateEnum.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> tap(BuildContext context, String path) async {
    var shell = Shell();

    try {
      shell.run('$_localPath\\shortcut\\$path');

      await Future.delayed(const Duration(seconds: 1));

      minimizeApp();
    } catch (error) {
      debugPrint('Erro ao executar o script CMD: $error');
    }
  }

  Future<void> reload() async {
    animationController.forward();

    await Future.delayed(const Duration(seconds: 1));

    animationController.reverse();
  }

  void closeApp() => windowManager.close();

  void minimizeApp() => windowManager.minimize();

  void launchURL() async {
    Uri uri = Uri.parse('https://icons8.com.br');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
