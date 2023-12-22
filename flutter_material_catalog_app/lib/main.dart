import 'package:flutter/material.dart';
import 'package:flutter_material_catalog_app/providers/ui_provider.dart';
import 'package:flutter_material_catalog_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UiProvider(ThemeData.light()))
        ],
        builder: (context, child) {
          return MaterialApp(
              title: 'Flutter Material 3',
              debugShowCheckedModeBanner: false,
              theme: Provider.of<UiProvider>(context).getTheme(),
              home: const HomeScreen());
        });
  }
}
