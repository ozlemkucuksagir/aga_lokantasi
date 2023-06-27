import 'dart:convert';

import 'package:aga_lokantasi/components/constant.dart';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<dynamic> categorys;
  late List<dynamic> getSelectedCategorys;
  late bool loading = true;

  /* @override
  void initState() {
    super.initState();

    setState(() {
      getAllCategorysService();
    });

    // availableDate();
    //allRandevularofDoctorListele(widget.oidDoktor);
  } service gelince açılacak TODO
*/
  getAllCategorysService() async {
    // const String url = "${baseURL}askiminYazcagiUrl";

    String url = "https://jsonplaceholder.typicode.com/todos/1";
    //var demo = (UserRequestModel(username: username, password: password));
    //print(jsonEncode(demo));

    var dio = Dio();
    //CacheManagerKey token = CacheManagerKey.TOKEN;
    dio.options.headers['content-Type'] = 'application/json';
    //dio.options.headers["Authorization"] = "Bearer $token";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      setState(() {
        categorys = json.decode(response.data);
        loading = false;
        /*  print(categorys);
        print(categorys.runtimeType);*/
        // print(token);
      });
      return categorys;
    }
    //print(token);
  }

  getSelectedCategorysService(int oid) async {
    String oidStr = oid.toString();
    //String url = "${baseURL}askiminYazcagiUrl/?id=" + oidStr;

    String url = "https://jsonplaceholder.typicode.com/todos/1";
    //var demo = (UserRequestModel(username: username, password: password));
    //print(jsonEncode(demo));

    var dio = Dio();
    //CacheManagerKey token = CacheManagerKey.TOKEN;
    dio.options.headers['content-Type'] = 'application/json';
    //dio.options.headers["Authorization"] = "Bearer $token";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      setState(() {
        categorys = json.decode(response.data);
        loading = false;
        /*  print(categorys);
        print(categorys.runtimeType);*/
        // print(token);
      });
      return categorys;
    }
    //print(token);
  }

  List<Map<String, dynamic>> category = [
    {
      'photo':
          "https://www.basardilarturizm.com/wp-content/uploads/2020/01/gurme-menuler.jpg",
      'name': 'Ana Yemek',
      'id': 1,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Tatlı',
      'id': 2,
    },
    {
      'photo':
          "https://thehousecafe.com/wp-content/uploads/2019/07/menu-button-icecek.jpg",
      'name': 'Sıcak İçecekler',
      'id': 3,
    },
    {
      'photo':
          "https://www.coffeeconpanna.com/files/soguk-kahveler_51_1531766749.png",
      'name': 'Soğuk İçecekler',
      'id': 4,
    },
    {
      'photo':
          "https://img-s1.onedio.com/id-58bff00b8f92ded60e345fc3/rev-0/w-600/h-368/f-jpg/s-da884238dffe19f7a23cc9f71a6e004af1bfee37.jpg",
      'name': 'İçecek',
      'id': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width, // EKRANIN GENİŞLİĞİ
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "KATEGORİLER",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor, blurRadius: 4, spreadRadius: 2)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print("bastin");
                        },
                        child: ClipRect(
                          child: FancyShimmerImage(
                            height: size.height * 0.45,
                            width: size.width * 0.45,
                            errorWidget: Icon(
                              IconlyBold.danger,
                              color: Colors.red,
                              size: 28,
                            ),
                            imageUrl: category[index]['photo'],
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: cardColor.withOpacity(0.5),
                          width: size.width * 0.45,
                          child: Text(
                            category[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
