import 'dart:convert';
import 'dart:io';

import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/domain/entities/tab_entity.dart';
import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class HomeController extends ChangeNotifier {
  /// Observers
  PageStateEnum _pageState = PageStateEnum.load;
  PageStateEnum get pageState => _pageState;

  String _pathLocal = '';

  final List<TabEntity> tabs = [];

  Future<void> initConfig(BuildContext context) async {
    _pageState = PageStateEnum.load;
    notifyListeners();

    try {
      final String? path = await _getPath();

      if (path == null || path == '') {
        final newPath = await _configPath(context);

        await _setPath(newPath);

        _pathLocal = newPath;
      } else {
        _pathLocal = path;
      }

      /// Carregando Configuração
      final File jsonsPath = File('$path\\config.json');
      final String jsonsString = await jsonsPath.readAsString();
      final configJson = jsonDecode(jsonsString);

      if ((configJson['tabs'] as List).isEmpty) {
        _pageState = PageStateEnum.empty;

        return;
      }

      for (final tab in configJson['tabs']) {
        tabs.add(TabEntity.fromMap(tab));
      }

      _pageState = PageStateEnum.success;
    } catch (_) {
      _pageState = PageStateEnum.error;
    } finally {
      notifyListeners();
    }
  }

  String getIcons() {
    return '$_pathLocal\\icons';
  }

  Future<void> tap(BuildContext context, String pathTap) async {
    var shell = Shell(workingDirectory: '$_pathLocal\\shortcut');

    try {
      shell.run(pathTap);

      await Future.delayed(const Duration(seconds: 1));

      minimizeApp();
    } catch (error) {
      debugPrint('Erro ao executar o script CMD: $error');
    }
  }

  void launchURL() async {
    Uri uri = Uri.parse('https://icons8.com.br');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> configPathApp(BuildContext context) async {
    await _setPath('');

    await initConfig(context);
  }

  void minimizeApp() => windowManager.minimize();

  void closeApp() => windowManager.close();

  Future<String> _configPath(BuildContext context) async {
    final TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          child: SizedBox(
            height: 180,
            width: 360,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Digite o Path da Aplicação:'),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return controller.text;
  }

  Future<String?> _getPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localPath = prefs.getString('localPath');

    return localPath;
  }

  Future<void> _setPath(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('localPath', path);
  }
}
