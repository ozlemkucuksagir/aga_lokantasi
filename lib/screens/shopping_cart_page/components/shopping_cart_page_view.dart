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

class ShoppingCartView extends StatefulWidget {
  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
        ],
      ),
    );
  }
}
