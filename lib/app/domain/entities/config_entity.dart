class AppEntity {
  final String name;
  final String logo;
  final String script;

  AppEntity({
    required this.name,
    required this.logo,
    required this.script,
  });

  factory AppEntity.fromMap(Map<String, dynamic> map) {
    return AppEntity(
      name: map['name'] as String,
      logo: map['logo'] as String,
      script: map['script'] as String,
    );
  }
}
