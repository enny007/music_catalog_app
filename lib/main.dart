import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_1/provider/catalog_provider.dart';
import 'package:simple_provider_1/provider/theme_settings.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatalogProv(),
        ),
        ChangeNotifierProvider(
          create: ((context) => ThemeSettings()),
        ),
      ],
      child: Consumer<ThemeSettings>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Music Catalog',
            theme:
                provider.darkTheme ? MyThemes.darkTheme : MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}
