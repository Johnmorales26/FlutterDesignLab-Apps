import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>?> readMainOptionsFromJSON() async {
    try {
      // Lee el archivo JSON desde los activos
      String datosJson = await rootBundle.loadString('i18n/en.json');
      // Decodifica el JSON en un mapa
      Map<String, dynamic> datos = json.decode(datosJson);
      return datos;
    } catch (e) {
      print('Error al leer o decodificar el JSON: $e');
      return null;
    }
  }