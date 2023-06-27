import 'dart:convert';

import 'package:aga_lokantasi/components/constant.dart';
import 'package:aga_lokantasi/screens/food_detail_page/food_detail_page.dart';
import 'package:aga_lokantasi/widgets/counter_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderItems extends StatefulWidget {
  const OrderItems({Key? key}) : super(key: key);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  late int myCounter;
  late List<dynamic> orderFoods;
  late bool loading = false; //api baglaninca true olacak TODO

  List<Map<String, dynamic>> populerFoodsStatic = [
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name':
          'Ana YemekAna YemekAna YemekAna YemekAna YemekAna YemekAna YemekAna YemekAna YemekAna Yemek',
      'description':
          'Çıkarılacak malzeme tercihi : Patates kızartması\nGramaj Tercihi: 125 g',
      'price': 30.99,
      'id': 1,
      'rating': "4.5",
      'counter': 9,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Tatlı',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 2,
      'rating': "4",
      'counter': 8,
    },
    {
      'photo':
          "https://thehousecafe.com/wp-content/uploads/2019/07/menu-button-icecek.jpg",
      'name': 'Sıcak İçecekler',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 3,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Soğuk İçecekler',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 4,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://img-s1.onedio.com/id-58bff00b8f92ded60e345fc3/rev-0/w-600/h-368/f-jpg/s-da884238dffe19f7a23cc9f71a6e004af1bfee37.jpg",
      'name': 'İçecekİçecekİçecekİçecekİçecekİçecek',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 5,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Ana Yemek',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 1,
      'rating': "4.5",
      'counter': 2,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Tatlı',
      'description': 'İcinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 2,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://thehousecafe.com/wp-content/uploads/2019/07/menu-button-icecek.jpg",
      'name': 'Sıcak İçecekler',
      'description': 'icinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 3,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://image.istanbul.net.tr/uploads/2020/12/news/ozsutten-surprizlerle-dolu-kis-menusu-770x470.jpg",
      'name': 'Soğuk İçecekler',
      'description': 'icinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 4,
      'rating': "4",
      'counter': 2,
    },
    {
      'photo':
          "https://img-s1.onedio.com/id-58bff00b8f92ded60e345fc3/rev-0/w-600/h-368/f-jpg/s-da884238dffe19f7a23cc9f71a6e004af1bfee37.jpg",
      'name': 'İçecek',
      'description': 'icinde neler neler var bi bilsen lezizz!!!',
      'price': 30.99,
      'id': 5,
      'rating': "4",
      'counter': 2,
    },
  ];

  @override
  void initState() {
    getPopulerFoods();
    super.initState();
  }

  getPopulerFoods() async {
    const String url = "${baseURL}api/mobil/favoriDoktorDetayListe";
    //var demo = (UserRequestModel(username: username, password: password));
    //print(jsonEncode(demo));

    var dio = Dio();
    //CacheManagerKey token = CacheManagerKey.TOKEN;
    dio.options.headers['content-Type'] = 'application/json';
    //dio.options.headers["Authorization"] = "Bearer $token";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      setState(() {
        populerFoodsStatic = json.decode(response.data);
        loading = false;
      });
      return populerFoodsStatic;
    }
    //print(token);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Center(
      child: loading
          ? CircularProgressIndicator()
          : !(populerFoodsStatic.length <= 0)
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: populerFoodsStatic.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: size.width * 1,
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: kPrimaryColor,
                                    blurRadius: 4,
                                    spreadRadius: 2)
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          /*
                                            dc!.fetchDoctorDetail(display_list[
                                                    index]
                                                .oid);*/
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FoodDetailPage(
                                                      food: populerFoodsStatic[
                                                          index],

                                                      //id: display_list[index].ID!,
                                                    )),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            populerFoodsStatic[index]['photo'],
                                            width: size.width * 0.26,
                                            height: size.height * 0.2,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: size.width * 0.4,
                                            child: Text(
                                              populerFoodsStatic[index]['name'],
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: size.width * 0.4,
                                            child: Text(
                                              populerFoodsStatic[index]
                                                  ['description'],
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),

                                        /*  SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              populerFoodsStatic[index]
                                                  ['doktorSoyadi'],
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),*/
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          child: CounterWidget(
                                        counter: populerFoodsStatic[index]
                                            ['counter'],
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: populerFoodsStatic[index]
                                                    ['price']
                                                .toString(),
                                            /*TODO BURDAN  populerFoodsStatic[index]['counter']*populerFoodsStatic[index]['price'] YAPILACAK ŞU AN YAPAMIYORUM ÇÜNKÜ populerFoodsStatic[index]['counter'] GÜNCELLENMESİ
                                                  CounterWidget(   ) İÇİNDEKİ SETSTATELER İLE YAPILMALI
                                           */

                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kPrimaryMidColor,
                                                fontSize: 11),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: " TL",
                                                style: TextStyle(
                                                    color: kPrimaryMidColor,
                                                    fontSize: 10),
                                              )
                                            ]),
                                      ),

                                      /*   RichText(
                                            text: TextSpan(
                                                text:
                                                    populerFoodsStatic[index]
                                                            ['price']
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: kPrimaryMidColor,
                                                    fontSize: 13),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: " TL",
                                                    style: TextStyle(
                                                        color:
                                                            kPrimaryMidColor,
                                                        fontSize: 12),
                                                  )
                                                ]),
                                          ),*/
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    );
                  })
              : Text("error"),
    ));
  }
}
