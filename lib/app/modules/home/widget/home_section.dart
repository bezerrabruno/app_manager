import 'package:app_manager/app/core/widgets/app_custom_scroll.dart';
import 'package:app_manager/app/domain/entities/config_entity.dart';
import 'package:app_manager/app/modules/home/widget/home_mini_card.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final List<AppEntity> apps;
  final Function(String) onTap;

  const HomeSection({
    super.key,
    required this.title,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
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
              behavior: AppCustomScroll(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return HomeMiniCard(
                    image: apps.elementAt(index).logo,
                    onTap: () => onTap(apps.elementAt(index).script),
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
