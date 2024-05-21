import 'package:app_manager/app/core/widgets/app_custom_scroll.dart';
import 'package:app_manager/app/domain/entities/config_entity.dart';
import 'package:app_manager/app/modules/home/widget/home_card.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final int flex;
  final List<AppEntity> apps;
  final Function(String) onTap;

  const HomeSection({
    super.key,
    required this.title,
    required this.flex,
    required this.apps,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Expanded(
      flex: flex,
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
                      image: apps.elementAt(index).logo,
                      onTap: () => onTap(apps.elementAt(index).script),
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
