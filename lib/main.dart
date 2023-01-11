import 'package:flutter/material.dart';
import 'package:ft_dark_light_ex/theme_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode,
        home: const HomeScreen(),
      );
    });
  }
}
