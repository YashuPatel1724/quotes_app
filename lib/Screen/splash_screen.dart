import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/categary/Quotable logo (2).png')),
          SizedBox(height: 10,),
          Text(
            textAlign: TextAlign.center,
            'Hang On \n We are fetching quotes for you',
            style: TextStyle(color: Colors.white70,fontSize: 18),
          )
        ],
      )),
    );
  }
}
