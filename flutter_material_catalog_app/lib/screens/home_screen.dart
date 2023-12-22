import 'package:flutter/material.dart';
import 'package:flutter_material_catalog_app/providers/ui_provider.dart';
import 'package:flutter_material_catalog_app/widgets/main_bottom_sheet.dart';
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
        body: _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Text('fd'),
            ),
          ),
        ],
      ),
    );
  }
}
