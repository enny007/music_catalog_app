import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_1/provider/catalog_provider.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Music Catalog',
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.yellow,
            )),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
