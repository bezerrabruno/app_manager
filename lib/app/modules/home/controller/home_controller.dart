import 'dart:convert';
import 'dart:io';

import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/domain/entities/config_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:process_run/shell.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class HomeController extends ChangeNotifier {
  late final String _localPath;

  /// Vars
  PageStateEnum _pageState = PageStateEnum.load;

  /// Uses
  PageStateEnum get pageState => _pageState;

  List<AppEntity> dev = [];
  List<AppEntity> software = [];
  List<AppEntity> hardware = [];
  List<AppEntity> game = [];

  Future<void> init() async {
    try {
      _pageState = PageStateEnum.load;
      notifyListeners();

      _localPath = 'C:\\my_apps\\app_manager';

      File jsonsPath = File('$_localPath\\config.json');

      String jsonsString = await jsonsPath.readAsString();

      final config = jsonDecode(jsonsString);

      for (final item in config['dev']) {
        dev.add(AppEntity.fromMap(item));
      }

      for (final item in config['softwares']) {
        software.add(AppEntity.fromMap(item));
      }

      for (final item in config['hardwares']) {
        hardware.add(AppEntity.fromMap(item));
      }

      for (final item in config['games']) {
        game.add(AppEntity.fromMap(item));
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

      await Future.delayed(const Duration(seconds: 2));

      closeApp();
    } catch (error) {
      debugPrint('Erro ao executar o script CMD: $error');
    }
  }

  void closeApp() => windowManager.close();

  void launchURL() async {
    Uri uri = Uri.parse('https://icons8.com.br');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
