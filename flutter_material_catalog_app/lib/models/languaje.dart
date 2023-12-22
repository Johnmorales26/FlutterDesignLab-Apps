import 'dart:convert';

Languajes languajesFromJson(String str) => Languajes.fromJson(json.decode(str));

String languajesToJson(Languajes data) => json.encode(data.toJson());

class Languajes {
  final List<Menu> menu;

  Languajes({
    required this.menu,
  });

  factory Languajes.fromJson(Map<String, dynamic> json) => Languajes(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  final int id;
  final String name;
  final String description;
  final List<SubItem> items;

  Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        items:
            List<SubItem>.from(json["items"].map((x) => SubItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class SubItem {
  final int id;
  final String name;
  final String description;

  SubItem({
    required this.id,
    required this.name,
    required this.description,
  });

  // Método para crear una instancia de SubItem desde un mapa (JSON)
  factory SubItem.fromJson(Map<String, dynamic> json) {
    return SubItem(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  // Método para convertir una instancia de SubItem a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
