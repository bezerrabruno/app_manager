import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/modules/home/controller/home_controller.dart';
import 'package:app_manager/app/modules/home/widget/home_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          switch (controller.pageState) {
            case PageStateEnum.load:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PageStateEnum.empty:
            case PageStateEnum.error:
              return Center(
                child: Text(
                  'Algo aconteceu, tente novamente.',
                  style: TextStyle(
                    fontSize: 28,
                    color: colors.primary,
                  ),
                ),
              );

            case PageStateEnum.success:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'App Manager',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: colors.primary,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () => controller.launchURL(),
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
                              onPressed: () => setState(() {}),
                              icon: Icon(
                                Icons.update,
                                color: colors.primary,
                              ),
                            ),
                            IconButton(
                              onPressed: () => controller.closeApp(),
                              icon: Icon(
                                Icons.close,
                                color: colors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    HomeSection(
                      title: 'Dev',
                      flex: 2,
                      apps: controller.dev,
                      onTap: (value) => controller.tap(context, value),
                    ),
                    const SizedBox(height: 40),
                    HomeSection(
                      title: 'Software',
                      flex: 2,
                      apps: controller.software,
                      onTap: (value) => controller.tap(context, value),
                    ),
                    const SizedBox(height: 40),
                    HomeSection(
                      title: 'Hardware',
                      flex: 2,
                      apps: controller.hardware,
                      onTap: (value) => controller.tap(context, value),
                    ),
                    const SizedBox(height: 40),
                    HomeSection(
                      title: 'Games',
                      flex: 4,
                      apps: controller.game,
                      onTap: (value) => controller.tap(context, value),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
