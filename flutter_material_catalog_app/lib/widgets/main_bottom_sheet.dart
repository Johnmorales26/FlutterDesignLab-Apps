import 'package:flutter/material.dart';
import 'package:flutter_material_catalog_app/AppLocations.dart';
import 'package:flutter_material_catalog_app/providers/ui_provider.dart';

Widget buildBottomSheet(BuildContext context, UiProvider uiProvider,
    Brightness systemBrightness, TextDirection systemTextDirection) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)
                  ?.translate('main_modal_bottom_sheet_theme') ??
              ''),
          ThemeOptionWidget(
              uiProvider: uiProvider, systemBrightness: systemBrightness),
          const Divider(),
          Text(AppLocalizations.of(context)
                  ?.translate('main_modal_bottom_sheet_text_direction') ??
              ''),
          TextDirectionOptionsWidget(
              uiProvider: uiProvider, systemTextDirection: systemTextDirection),
          const Divider(),
        ],
      ),
    ),
  );
}

class ThemeOptionWidget extends StatelessWidget {
  final UiProvider uiProvider;
  final Brightness systemBrightness;

  const ThemeOptionWidget(
      {super.key, required this.uiProvider, required this.systemBrightness});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text("System"),
            value: ThemeOptions.system,
            groupValue: uiProvider.themeSelected,
            onChanged: (value) {
              uiProvider.toggleTheme(value, systemBrightness);
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("Light"),
            value: ThemeOptions.light,
            groupValue: uiProvider.themeSelected,
            onChanged: (value) {
              uiProvider.toggleTheme(value, systemBrightness);
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("Dark"),
            value: ThemeOptions.dark,
            groupValue: uiProvider.themeSelected,
            onChanged: (value) {
              uiProvider.toggleTheme(value, systemBrightness);
            },
          ),
        ),
      ],
    );
  }
}

class TextDirectionOptionsWidget extends StatelessWidget {
  final UiProvider uiProvider;
  final TextDirection systemTextDirection;

  const TextDirectionOptionsWidget(
      {super.key, required this.uiProvider, required this.systemTextDirection});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text("System"),
            value: ThemeTextDirection.system,
            groupValue: uiProvider.textDirectionSelected,
            onChanged: (value) {
              uiProvider.toggleTextDirection(value!, systemTextDirection);
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("LTR"),
            value: ThemeTextDirection.ltr,
            groupValue: uiProvider.textDirectionSelected,
            onChanged: (value) {
              uiProvider.toggleTextDirection(value!, systemTextDirection);
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("RTL"),
            value: ThemeTextDirection.rtl,
            groupValue: uiProvider.textDirectionSelected,
            onChanged: (value) {
              uiProvider.toggleTextDirection(value!, systemTextDirection);
            },
          ),
        )
      ],
    );
  }
}
