import 'dart:convert';

Languaje languajesFromJson(String str) => Languaje.fromJson(json.decode(str));

String languajesToJson(Languaje data) => json.encode(data.toJson());

class Languaje {
    final List<Menu> menu;

    Languaje({
        required this.menu,
    });

    factory Languaje.fromJson(Map<String, dynamic> json) => Languaje(
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
    final List<Menu> items;

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
        items: List<Menu>.from(json["items"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}
