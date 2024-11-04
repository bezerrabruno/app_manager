class ShortcutEntity {
  final String name;
  final String icon;
  final String lnk;

  ShortcutEntity({
    required this.name,
    required this.icon,
    required this.lnk,
  });

  factory ShortcutEntity.fromMap(Map<String, dynamic> map) {
    return ShortcutEntity(
      name: map['name'] as String,
      icon: map['icon'] as String,
      lnk: map['lnk'] as String,
    );
  }
}
