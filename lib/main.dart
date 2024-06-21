import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/user_login.dart';
import 'theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Libros Eternos',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(color: Colors.black),
              primaryColor: Colors.blue),
          themeMode: themeNotifier.themeMode,
          home: UserLogin(),
        );
      },
    );
  }
}
