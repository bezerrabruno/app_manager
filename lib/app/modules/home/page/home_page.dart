import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/core/widgets/state_message.dart';
import 'package:app_manager/app/modules/home/controller/home_controller.dart';
import 'package:app_manager/app/modules/home/widget/home_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.initConfig(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'App Manager',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => widget.controller.launchURL(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Icons by Icons8',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => widget.controller.configPathApp(context),
                      icon: Icon(
                        Icons.settings,
                        color: colors.primary,
                      ),
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () => widget.controller.minimizeApp(),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 16),
                        icon: Icon(
                          Icons.minimize,
                          color: colors.primary,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => widget.controller.closeApp(),
                      icon: Icon(
                        Icons.close,
                        color: colors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: widget.controller,
                builder: (context, _) {
                  switch (widget.controller.pageState) {
                    case PageStateEnum.load:
                      return const StateMessage(
                        message: 'Carregando Informações...',
                      );

                    case PageStateEnum.empty:
                      return const StateMessage(
                        message: 'Adicione algum item ao json de configuração.',
                      );

                    case PageStateEnum.error:
                      return const StateMessage(
                        message: 'Algo aconteceu, tente novamente.',
                      );

                    case PageStateEnum.success:
                      return Column(
                        children: List.generate(
                          widget.controller.tabs.length,
                          (index) {
                            final item =
                                widget.controller.tabs.elementAt(index);

                            return HomeSection(
                              title: item.name,
                              pathIcon: widget.controller.getIcons(),
                              apps: item.apps,
                              onTap: (path) =>
                                  widget.controller.tap(context, path),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
