import 'package:app_manager/app/core/enums/page_state_enum.dart';
import 'package:app_manager/app/core/widgets/state_message.dart';
import 'package:app_manager/app/modules/home/controller/home_controller.dart';
import 'package:app_manager/app/modules/home/widget/home_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    _controller.init(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.inverseSurface,
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
                      onTap: () => _controller.launchURL(),
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
                      onPressed: () async {
                        await _controller.reload();

                        setState(() {});
                      },
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        color: colors.primary,
                        progress: _controller.animationController,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _controller.closeApp(),
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
                listenable: _controller,
                builder: (context, _) {
                  switch (_controller.pageState) {
                    case PageStateEnum.load:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case PageStateEnum.empty:
                      return const StateMessage(
                        message: 'Adicione algum item ao json.',
                      );

                    case PageStateEnum.error:
                      return const StateMessage(
                        message: 'Algo aconteceu, tente novamente.',
                      );

                    case PageStateEnum.success:
                      return Column(
                        children: List.generate(
                          _controller.config.length,
                          (index) {
                            final item = _controller.config.elementAt(index);

                            return HomeSection(
                              title: item.tab,
                              apps: item.apps,
                              onTap: (path) => _controller.tap(context, path),
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
