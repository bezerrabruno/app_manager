import 'package:app_manager/app/home/home_controller.dart';
import 'package:app_manager/app/widget/app_card.dart';
import 'package:app_manager/app/widget/custom_scroll.dart';
import 'package:app_manager/app/widget/mini_card.dart';
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
    controller.initController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'App Manager',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Software',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colors.onBackground,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScroll(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.softwares.length,
                  itemBuilder: (context, index) {
                    return MiniCard(
                      image: controller.softwares.elementAt(index).logo,
                      onTap: () => controller
                          .tap(controller.softwares.elementAt(index).script),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hardware',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colors.onBackground,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScroll(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.hardwares.length,
                  itemBuilder: (context, index) {
                    return MiniCard(
                      image: controller.hardwares.elementAt(index).logo,
                      onTap: () => controller
                          .tap(controller.hardwares.elementAt(index).script),
                    );
                  },
                ),
              ),
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
                behavior: CustomScroll(),
                child: GridView.builder(
                  itemCount: controller.games.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: AppCard(
                        image: controller.games.elementAt(index).logo,
                        name: controller.games.elementAt(index).name,
                        onTap: () => controller
                            .tap(controller.games.elementAt(index).script),
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
        ),
      ),
    );
  }
}
