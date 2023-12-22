import 'package:flutter/material.dart';
import 'package:flutter_material_catalog_app/models/languaje.dart';

class MainCardOption extends StatelessWidget {
  final Brightness systemBrightness;
  final Menu menu;

  const MainCardOption(
      {super.key, required this.systemBrightness, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Alinear la imagen al centro
            Center(
              child: Image.asset(
                systemBrightness != Brightness.light
                    ? 'assets/images/ic_dark.png'
                    : 'assets/images/ic_light.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
                width: 32), // Agregar espacio entre la imagen y el texto
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(menu.name),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
