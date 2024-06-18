class AppEntity {
  final String name;
  final String icon;
  final String link;

  AppEntity({
    required this.name,
    required this.icon,
    required this.link,
  });

  factory AppEntity.fromMap(Map<String, dynamic> map) {
    return AppEntity(
      name: map['name'] as String,
      icon: map['icon'] as String,
      link: map['link'] as String,
    );
  }
}
