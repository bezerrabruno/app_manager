import 'dart:convert';
import 'dart:io';

import 'package:app_manager/app/entities/config_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class HomeController {
  late final String _localPath;

  List<ConfigEntity> softwares = [];
  List<ConfigEntity> hardwares = [];
  List<ConfigEntity> games = [];

  Future<void> initController() async {
    final directory = await getApplicationDocumentsDirectory();

    _localPath = '${directory.path}\\app_manager';

    File jsonsPath = File('$_localPath\\config\\config.json');
    String jsonsString = await jsonsPath.readAsString();

    final config = jsonDecode(jsonsString);

    for (final item in config['softwares']) {
      softwares.add(ConfigEntity.fromMap(item));
    }

    for (final item in config['hardwares']) {
      hardwares.add(ConfigEntity.fromMap(item));
    }

    for (final item in config['games']) {
      games.add(ConfigEntity.fromMap(item));
    }
  }

  void tap(String path) {
    Process.run('$_localPath\\$path', []).then((ProcessResult results) {
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
  }
}
