import 'package:deviniti_app/src/features/home/presentation/home_page.dart';
import 'package:deviniti_app/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWigget extends StatelessWidget {
  const AppWigget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Garden',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'NotoSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
