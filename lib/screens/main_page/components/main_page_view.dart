import 'dart:convert';
import 'package:aga_lokantasi/components/constant.dart';
import 'package:aga_lokantasi/screens/food_detail_page/food_detail_page.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/category_widget.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/populer_widget.dart';
import 'package:aga_lokantasi/screens/main_page/components/widgets/slider_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainPageView extends StatefulWidget {
  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Ara",
                      filled: true,
                      fillColor: cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: cardColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      suffixIcon:
                          Icon(IconlyLight.search, color: kPrimaryColor)),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    autoplay: true,
                    itemCount: 3,
                    duration: 500,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (ctx, index) {
                      return SliderWidgetMy(
                        indexMy: index,
                      );
                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: kPrimaryLightColor,
                          activeColor: kPrimaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width, // EKRANIN GENİŞLİĞİ
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Populer Yemekler",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                TextButton(
                  child: Text(
                    "Hepsini gör",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onPressed: () {
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorListScreen(),
                      ));*/
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopulerFood(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryWidget(),
          ),
          /* GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.2),
              itemBuilder: (ctx, index) {
                return CategoryWidget();
              })*/
        ],
      ),
    );
  }

  /* Widget populerFoodsWidget() => Container(
      height: 300,
      child: Center(
        child: loading
            ? CircularProgressIndicator()
            : !(populerFoods.length <= 0)
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: populerFoods.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 250,
                            width: 150,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: kPrimaryColor,
                                      blurRadius: 4,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
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
                                                      food: populerFoods[index],

                                                      //id: display_list[index].ID!,
                                                    )),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          child: Image.asset(
                                            "assets/images/doctor1.jpg",
                                            width: 180,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: kPrimaryLightColor,
                                                    blurRadius: 4,
                                                    spreadRadius: 2)
                                              ]),
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite_outline,
                                              color: kPrimaryColor,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          populerFoods[index]['doktorAdi'],
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          populerFoods[index]['doktorSoyadi'],
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                double.parse(double.parse(
                                                            populerFoods[index][
                                                                'yildizOrtalamasi'])
                                                        .toStringAsFixed(2))
                                                    .toString(), //cerokozi
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: textColorMid,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      );
                    })
                : Text("error"),
      ));*/
}
