import 'package:flutter/material.dart';

class MainCardOption extends StatelessWidget {
  final Brightness systemBrightness;

  const MainCardOption({super.key, required this.systemBrightness});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Alinear la imagen al centro
            Center(
              child: Image.asset(
                systemBrightness != Brightness.light
                    ? 'assets/images/ic_dark.png'
                    : 'assets/images/ic_light.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(
                width: 16), // Agregar espacio entre la imagen y el texto
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Bage'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
