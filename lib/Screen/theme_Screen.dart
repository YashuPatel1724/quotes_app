import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/global/theme_list.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121615),
      appBar: AppBar(
        backgroundColor: Color(0xff121615),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text(
          'Themes',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 55/93),
        itemCount: themes.length,
        itemBuilder: (context, index) =>
            InkWell(
              onTap: () {
                setState(() {
                  img = themes[index];
                  Navigator.of(context).pushNamed('/home');
                });
              },
              child: Container(
                margin: (index%1==0)?EdgeInsets.only(top: 15,left: 5) : null,
                        decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('${themes[index]}')
              )
                        ),
                      ),
            ),
      ),
    );
  }
}
