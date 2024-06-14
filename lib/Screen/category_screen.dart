
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotes_app/global/globalKey.dart';
import 'package:quotes_app/global/homequote.dart';
import 'package:quotes_app/global/category.dart';


class CategaryScreen extends StatefulWidget {
  const CategaryScreen({super.key});

  @override
  State<CategaryScreen> createState() => _CategaryScreenState();
}

class _CategaryScreenState extends State<CategaryScreen> {
  @override
  void initState() {
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        width: 260,
        elevation: 10,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
                    'assets/categary/Quotable logo (2).png')),
            ListTile(
              onTap: () {
                setState(() {
                  drawer1 = !drawer1;
                  if (drawer1 == true) {
                    drawer2 = false;
                    drawer3 = false;
                    drawer4 = false;
                  }
                  Navigator.of(context).pushNamed('/theme');
                });
              },
              tileColor: (drawer1 == true) ? Color(0xffF0562A) : null,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Icon(
                  Icons.palette,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8),
                child: Text(
                  'Themes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  drawer2 = !drawer2;
                  if (drawer2 == true) {
                    drawer1 = false;
                    drawer3 = false;
                    drawer4 = false;
                  }
                });
              },
              tileColor: (drawer2 == true) ? Color(0xffF0562A) : null,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.star_outline_sharp,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Rate Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  drawer3 = !drawer3;
                  if (drawer3 == true) {
                    drawer1 = false;
                    drawer2 = false;
                    drawer4 = false;
                  }
                });
              },
              tileColor: (drawer3 == true) ? Color(0xffF0562A) : null,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'More Apps',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              onTap: () async{
                setState(()  {
                  drawer4 = !drawer4;
                  if (drawer4 == true) {
                    drawer1 = false;
                    drawer2 = false;
                    drawer3 = false;
                  }

                });
              },
              tileColor: (drawer4 == true) ? Color(0xffF0562A) : null,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Share',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        iconTheme: IconThemeData(color: Colors.white, size: 28),
        title: Text(
          'Category',
          style: TextStyle(color: Colors.white, fontSize: 28, letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/fav');
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      advestise.length,
                      (index) => Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('${advestise[index]}')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  // onPageChanged: (value) {
                  //  setState(() {
                  //    Index = value;
                  //  });
                  // },
                ),
              ),
            ),
            Wrap(
              children: [
                ...List.generate(
                  categoryImage.length,
                  (index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            CategoryList.clear();
                            for (int i = 0; i < QuotesList.length; i++) {
                              if (categoryName[index] ==
                                  QuotesList[i]['cate']) {
                                CategoryList.add(QuotesList[i]);
                              }
                            }
                            Navigator.of(context).pushNamed('/home');
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30, left: 5, right: 5),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('${categoryImage[index]}'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${categoryName[index]}',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

int Index = 0;
bool drawer1 = false;
bool drawer2 = false;
bool drawer3 = false;
bool drawer4 = false;

bool rate = false;
