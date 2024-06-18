import 'package:app_manager/app/domain/entities/app_entity.dart';

class ConfigEntity {
  final String tab;
  final List<AppEntity> apps;

  ConfigEntity({
    required this.tab,
    required this.apps,
  });

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    final apps = <AppEntity>[];

    for (final item in map['apps']) {
      apps.add(AppEntity.fromMap(item));
    }

    return ConfigEntity(
      tab: map['tab'] as String,
      apps: apps,
    );
  }
}
