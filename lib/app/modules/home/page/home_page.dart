import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/core/widgets/app_custom_scroll.dart';
import 'package:app_manager/app/modules/home/controller/home_controller.dart';
import 'package:app_manager/app/modules/home/widget/home_card.dart';
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
                    color: colors.onBackground,
                  ),
                ),
              );

            case PageStateEnum.success:
              return Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'App Manager',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: colors.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  HomeSection(
                    title: 'Dev',
                    apps: controller.dev,
                    onTap: (value) => controller.tap(context, value),
                  ),
                  const SizedBox(height: 32),
                  HomeSection(
                    title: 'Software',
                    apps: controller.software,
                    onTap: (value) => controller.tap(context, value),
                  ),
                  const SizedBox(height: 32),
                  HomeSection(
                    title: 'Hardware',
                    apps: controller.hardware,
                    onTap: (value) => controller.tap(context, value),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Games',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colors.onBackground,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ScrollConfiguration(
                      behavior: AppCustomScroll(),
                      child: GridView.builder(
                        itemCount: controller.game.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: HomeCard(
                              image: controller.game.elementAt(index).logo,
                              name: controller.game.elementAt(index).name,
                              onTap: () => controller.tap(context,
                                  controller.game.elementAt(index).script),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () => setState(() {}),
                        icon: const Icon(Icons.update)),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
