class ConfigEntity {
  final String name;
  final String logo;
  final String script;

  ConfigEntity({
    required this.name,
    required this.logo,
    required this.script,
  });

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    return ConfigEntity(
      name: map['name'] as String,
      logo: map['logo'] as String,
      script: map['script'] as String,
    );
  }
}
