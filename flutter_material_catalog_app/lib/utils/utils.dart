import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_material_catalog_app/models/languaje.dart';

Future<Languajes?> readMainOptionsFromJSON() async {
  try {
    // Lee el archivo JSON desde los activos
    String datosJson = await rootBundle.loadString('i18n/menu.json');
    // Decodifica el JSON en un mapa
    Map<String, dynamic> jsonData = json.decode(datosJson);
    Languajes languajes = Languajes.fromJson(jsonData);
    return languajes;
  } catch (e) {
    print('Error al leer o decodificar el JSON: $e');
    return null;
  }
}
