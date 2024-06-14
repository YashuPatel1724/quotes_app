import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/Screen/category_screen.dart';
import 'package:quotes_app/Screen/favourite_screen.dart';
import 'package:quotes_app/Screen/homePage.dart';
import 'package:quotes_app/Screen/splash_screen.dart';
import 'package:quotes_app/global/globalKey.dart';

import 'Screen/theme_Screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => HomePage(),
        '/theme' : (context) => ThemeScreen(),
        '/cate' : (context) => CategaryScreen(),
        '/fav' : (context) => Favourite(),
        // '/image' : (context) => ImageSave(),
      },
    );
  }
}
