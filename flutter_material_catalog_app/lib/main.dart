import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_material_catalog_app/AppLocations.dart';
import 'package:flutter_material_catalog_app/providers/ui_provider.dart';
import 'package:flutter_material_catalog_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UiProvider(ThemeData.light()))
        ],
        builder: (context, child) {
          return MaterialApp(
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('es', 'ES'),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              title: 'Flutter Material 3',
              debugShowCheckedModeBanner: false,
              theme: Provider.of<UiProvider>(context).getTheme(),
              home: const HomeScreen());
        });
  }
}
