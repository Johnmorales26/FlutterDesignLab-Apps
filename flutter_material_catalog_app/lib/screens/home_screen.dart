import 'package:flutter/material.dart';
import 'package:flutter_material_catalog_app/models/languaje.dart';
import 'package:flutter_material_catalog_app/providers/ui_provider.dart';
import 'package:flutter_material_catalog_app/utils/utils.dart';
import 'package:flutter_material_catalog_app/widgets/main_bottom_sheet.dart';
import 'package:flutter_material_catalog_app/widgets/main_card_option.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiProvider uiProvider = Provider.of<UiProvider>(context);
    TextDirection systemTextDirection = Directionality.of(context);
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
    TextDirection textDirectionSelected = uiProvider.textDirection;

    return Directionality(
      textDirection: textDirectionSelected == TextDirection.rtl
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Material 3'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return buildBottomSheet(context, uiProvider,
                        systemBrightness, systemTextDirection);
                  },
                );
              },
              icon: const Icon(Icons.format_paint_outlined),
            ),
          ],
        ),
        body: _BodyContent(systemBrightness: systemBrightness),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final Brightness systemBrightness;

  const _BodyContent({required this.systemBrightness});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Languajes?>(
      // Llama a tu función fetchData dentro de future.
      future: readMainOptionsFromJSON(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras espera la respuesta, puedes mostrar un indicador de carga.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // En caso de error, puedes mostrar un mensaje de error.
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Cuando la operación asincrónica se completa con éxito, puedes trabajar con el resultado.
          final result = snapshot.data!;
          // Ahora puedes utilizar 'result' en tu pantalla.
          return ListView.builder(
            itemCount: result.menu.length,
            itemBuilder: (context, index) {
              return MainCardOption(systemBrightness: systemBrightness, menu: result.menu[index]);
            },
          );
        } else {
          // Si no hay errores, pero no hay datos aún, puedes mostrar un mensaje apropiado.
          return Text('No se recibieron datos');
        }
      },
    );
  }
}
