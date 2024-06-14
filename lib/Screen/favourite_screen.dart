import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/global/globalKey.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        title: Text(
          'Favourite',
          style: TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1),
        ),
      ),
      body: (favouriteList.isEmpty)
          ? Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign:  TextAlign.center,
                    'You Do Not Select Any\n Favourite Quotes',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 25,),
                  ),
                SizedBox(height: 8,),
                Text(
                  textAlign: TextAlign.center,
                  '(Please Select Your Favourite Quotes)',style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,),)
              ],
            ),
          )
          : buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: favouriteList.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            "${favouriteList[index]['quote']}",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "${favouriteList[index]['author']} - ${favouriteList[index]['cate']}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    favouriteList.removeAt(index);
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        color: Color(0xfff0562a),
      ),
    );
  }
}
