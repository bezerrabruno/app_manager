import 'dart:convert';
import 'dart:io';

import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/domain/entities/config_entity.dart';
import 'package:flutter/cupertino.dart';
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

      File jsonsPath = File('$_localPath\\config\\config.json');

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
    await Process.run('$_localPath\\$path', []).then((ProcessResult results) {
      String output = results.stdout.toString();
      String error = results.stderr.toString();

      if (output.isNotEmpty) {
        debugPrint('Saída do script CMD: $output');
      }

      if (error.isNotEmpty) {
        debugPrint('Erro ao executar o script CMD: $error');
      }
    }).catchError((error) {
      debugPrint('Erro ao executar o script CMD: $error');
    });

    windowManager.close();
  }
}
