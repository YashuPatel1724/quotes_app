import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/global/category.dart';
import 'package:quotes_app/global/font.dart';
import 'package:quotes_app/global/globalKey.dart';
import 'package:quotes_app/global/homequote.dart';
import 'package:quotes_app/global/theme_list.dart';
import 'package:quotes_app/utils/homeModel.dart';
import 'package:share_extend/share_extend.dart';

HomeModel? homeModel;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    homeModel =
        HomeModel.toList((CategoryList.isEmpty) ? QuotesList : CategoryList);
    super.initState();
  }

  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {});
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              '${img}',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            alignment: Alignment.center,
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                ...List.generate(
                  homeModel!.HomeModelList.length,
                  (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: textAlign,
                              '${homeModel!.HomeModelList[index].quote}',
                              style: GoogleFonts.getFont(googleFont!,
                                  fontSize: 30,
                                  color: color,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              children: [
                                Text(
                                  '${homeModel!.HomeModelList[index].author}',
                                  // style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 25,
                                  //     fontWeight: FontWeight.bold),
                                  style: GoogleFonts.permanentMarker(
                                    textStyle: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '(${homeModel!.HomeModelList[index].cate})',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog.fullscreen(
                                    backgroundColor: Color(0xff000000),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: RepaintBoundary(
                                            key: imgKey,
                                            child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          AssetImage('${img}')),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          textAlign: textAlign,
                                                          '${homeModel!.HomeModelList[index].quote}',
                                                          style: GoogleFonts
                                                              .getFont(
                                                                  googleFont!,
                                                                  fontSize: 30,
                                                                  color: color,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '${homeModel!.HomeModelList[index].author}',
                                                            // style: TextStyle(
                                                            //     color: Colors.white,
                                                            //     fontSize: 25,
                                                            //     fontWeight: FontWeight.bold),
                                                            style: GoogleFonts
                                                                .permanentMarker(
                                                              textStyle: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '(${homeModel!.HomeModelList[index].cate})',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  Navigator.of(context)
                                                      .pop(); //returns true/false
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xffF0562A)),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.cancel,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'cancle',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  RenderRepaintBoundary
                                                      boundry = imgKey
                                                              .currentContext!
                                                              .findRenderObject()
                                                          as RenderRepaintBoundary;

                                                  ui.Image image =
                                                      await boundry.toImage();
                                                  ByteData? byteData =
                                                      await image.toByteData(
                                                          format: ui
                                                              .ImageByteFormat
                                                              .png);

                                                  Uint8List img = byteData!
                                                      .buffer
                                                      .asUint8List();

                                                  ImageGallerySaver.saveImage(
                                                      img);
                                                 //returns true/false
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xffF0562A)),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.download,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Icon(
                              Icons.download_outlined,
                              size: 46,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (homeModel!.HomeModelList[index].isLike ==
                                      true) {
                                    homeModel!.HomeModelList[index].isLike =
                                        false;
                                  } else {
                                    homeModel!.HomeModelList[index].isLike =
                                        true;
                                  }
                                  if (homeModel!.HomeModelList[index].isLike ==
                                      true) {
                                    (CategoryList.isEmpty)
                                        ? favouriteList.add(QuotesList[index])
                                        : favouriteList
                                            .add(CategoryList[index]);
                                  } else {
                                    (CategoryList.isEmpty)
                                        ? favouriteList
                                            .remove(QuotesList[index])
                                        : favouriteList
                                            .remove(CategoryList[index]);
                                  }
                                });
                              },
                              icon: Icon(
                                (homeModel!.HomeModelList[index].isLike == true)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 50,
                                color:
                                    (homeModel!.HomeModelList[index].isLike ==
                                            true)
                                        ? Colors.red
                                        : Colors.white,
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog.fullscreen(
                                    backgroundColor: Color(0xff000000),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: RepaintBoundary(
                                            key: imgKey,
                                            child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          AssetImage('${img}')),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          textAlign: textAlign,
                                                          '${homeModel!.HomeModelList[index].quote}',
                                                          style: GoogleFonts
                                                              .getFont(
                                                                  googleFont!,
                                                                  fontSize: 30,
                                                                  color: color,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 50.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '${homeModel!.HomeModelList[index].author}',
                                                            // style: TextStyle(
                                                            //     color: Colors.white,
                                                            //     fontSize: 25,
                                                            //     fontWeight: FontWeight.bold),
                                                            style: GoogleFonts
                                                                .permanentMarker(
                                                              textStyle: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '(${homeModel!.HomeModelList[index].cate})',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  Navigator.of(context)
                                                      .pop(); //returns true/false
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xffF0562A)),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.cancel,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'cancle',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  RenderRepaintBoundary
                                                      boundry = imgKey
                                                              .currentContext!
                                                              .findRenderObject()
                                                          as RenderRepaintBoundary;

                                                  ui.Image image =
                                                      await boundry.toImage();
                                                  ByteData? byteData =
                                                      await image.toByteData(
                                                          format: ui
                                                              .ImageByteFormat
                                                              .png);

                                                  Uint8List img = byteData!
                                                      .buffer
                                                      .asUint8List();

                                                  final imgpath =
                                                      await getApplicationDocumentsDirectory();
                                                  final file = File(
                                                      "${imgpath.path}/img.png");

                                                  file.writeAsBytes(img);
                                                  ShareExtend.share(
                                                      file.path, 'image');
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xffF0562A)),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.share,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Share',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Icon(
                              Icons.share,
                              size: 46,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  Index = value;
                });
                print(Index);
              },
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/cate');
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0562A),
                ),
                child: Icon(
                  Icons.grid_view,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/theme');
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0562A),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.palette,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Text Alignment',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.left;
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.text_alignleft,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.center;
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.text_aligncenter,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.right;
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.text_alignright,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Font Family',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    fontFamilyList.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          googleFont = fontFamilyList[index];
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "Aa",
                                          style: GoogleFonts.getFont(
                                              fontFamilyList[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Text Color',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    colorList.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          color = colorList[index];
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: colorList[index],
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0562A),
                ),
                child: Icon(
                  Icons.text_fields,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog.fullscreen(
                    backgroundColor: Color(0xff000000),
                    child: Column(
                      children: [
                        Expanded(
                          child: RepaintBoundary(
                            key: imgKey,
                            child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('${img}')),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          textAlign: textAlign,
                                          '${homeModel!.HomeModelList[Index].quote}',
                                          style: GoogleFonts.getFont(
                                              googleFont!,
                                              fontSize: 30,
                                              color: color,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${homeModel!.HomeModelList[Index].author}',
                                            // style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 25,
                                            //     fontWeight: FontWeight.bold),
                                            style: GoogleFonts.permanentMarker(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '(${homeModel!.HomeModelList[Index].cate})',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffF0562A)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'cancle',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  RenderRepaintBoundary boundry =
                                      imgKey.currentContext!.findRenderObject()
                                          as RenderRepaintBoundary;

                                  ui.Image image = await boundry.toImage();
                                  ByteData? byteData = await image.toByteData(
                                      format: ui.ImageByteFormat.png);
                                  Uint8List img =
                                      byteData!.buffer.asUint8List();

                                  final path =
                                      await getApplicationDocumentsDirectory();

                                  final file = File('${path.path}/img.png');
                                  await file.writeAsBytes(img);
                                  int location = WallpaperManager
                                      .BOTH_SCREEN; //can be Home/Lock Screen
                                  bool result = await WallpaperManager
                                      .setWallpaperFromFile(
                                          file.path, location);

                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffF0562A)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.wallpaper,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Set As WallPaper',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0562A),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.wallpaper,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int Index = 0;
int selecIndex = 0;
// Future<void> setWallpaper(BuildContext context, int wallpaperLocation,final fileImg) async {
//   if (fileImg == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("No image available for setting wallpaper")),
//     );
//     return;
//   }
//
//   try {
//     await AsyncWallpaper.setWallpaperFromFile(
//       filePath: fileImg!.path,
//       wallpaperLocation: wallpaperLocation,
//       goToHome: false, // Set to false to prevent redirection
//       toastDetails: ToastDetails.success(),
//       errorToastDetails: ToastDetails.error(),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Wallpaper set successfully")),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Error setting wallpaper: ${e.toString()}")),
//     );
//   }
// }
