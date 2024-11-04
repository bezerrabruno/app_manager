import 'package:app_manager/app/domain/entities/shortcut_entity.dart';

class TabEntity {
  final String name;
  final List<ShortcutEntity> apps;

  TabEntity({
    required this.name,
    required this.apps,
  });

  factory TabEntity.fromMap(Map<String, dynamic> map) {
    final List<ShortcutEntity> shortcut = <ShortcutEntity>[];

    for (final item in map['shortcuts']) {
      shortcut.add(ShortcutEntity.fromMap(item));
    }

    return TabEntity(
      name: map['name'] as String,
      apps: shortcut,
    );
  }
}
