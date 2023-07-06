import 'dart:convert';
import 'package:aga_lokantasi/components/constant.dart';
import 'package:aga_lokantasi/screens/food_detail_page/food_detail_page.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/category_widget.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/populer_widget.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/slider_widget.dart';
import 'package:aga_lokantasi/screens/shopping_cart_page/components/order_items_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
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
  String waitingOrder = "Sipariş Ver";
  String ordered = "Sipariş Verildi";
  late double totalPrice = 0;
  bool isPress = false;
  final double minPrice = 300;

  getTotalPrice() {
    int i;
    for (i = 0; i < populerFoodsStatic.length; i++) {
      totalPrice +=
          (populerFoodsStatic[i]['price'] * populerFoodsStatic[i]['counter']);
    }
    return totalPrice;
  }

  @override
  void initState() {
    totalPrice = 10;
    //getTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  /*  decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: kPrimaryColor, blurRadius: 4, spreadRadius: 2)
                      ]),*/
                  height: size.height * 0.5,
                  child: OrderItems()),
            ),
            Divider(
              color: kPrimaryColor,
              height: 0,
              indent: size.width * 0.2,
              endIndent: size.width * 0.2,
              thickness: 1.5,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          totalPrice > minPrice ? Icons.check : Icons.error,
                          color: successful,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: size.height * 0.06,
                              child: (totalPrice / minPrice) > 1
                                  ? Text("\nMinimum sepet tutarına ulaştınız!")
                                  : RichText(
                                      text: TextSpan(
                                        text: minPrice.toString() +
                                            " ₺ minimum sepet tutarına ulaşmak için ",
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: (minPrice - totalPrice)
                                                      .toString() +
                                                  " ₺",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: successful)),
                                          TextSpan(
                                              text:
                                                  "değerinde ürün ekleyiniz."),
                                        ],
                                      ),
                                    )),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: size.width * 0.8,
                        child: LinearPercentIndicator(
                          animation: true,
                          backgroundColor: successfulTo,

                          animationDuration: 2500,

                          width: size.width * 0.8,
                          lineHeight: 10.0,
                          percent: (totalPrice / minPrice) > 1
                              ? 1
                              : (totalPrice /
                                  minPrice), //todo 300ü minimum sepet değeri verdim güncellenecek
                          progressColor: successful,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.065,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.6,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryLightColor,
                          ),
                          onPressed: !isPress
                              ? () {
                                  setState(() {
                                    //TODO SEPETİ TEMİZLE
                                    waitingOrder = "";
                                    waitingOrder = ordered;
                                    isPress = true;
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        backgroundColor: cardColor,
                                        title: Text("Başarılı"),
                                        content: Text("Siparişiniz alındı."),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              )),
                                        ],
                                      ),
                                      barrierDismissible: false,
                                    );
                                  });
                                }
                              : null,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                waitingOrder,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
