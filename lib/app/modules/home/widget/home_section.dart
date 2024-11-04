import 'package:app_manager/app/core/widgets/app_custom_scroll.dart';
import 'package:app_manager/app/domain/entities/shortcut_entity.dart';
import 'package:app_manager/app/modules/home/widget/home_card.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final String pathIcon;

  final List<ShortcutEntity> apps;
  final Function(String) onTap;

  const HomeSection({
    super.key,
    required this.title,
    required this.pathIcon,
    required this.apps,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: colors.primary,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: AppCustomScroll(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: HomeCard(
                      image: '$pathIcon\\${apps.elementAt(index).icon}',
                      onTap: () => onTap(
                        apps.elementAt(index).lnk,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
