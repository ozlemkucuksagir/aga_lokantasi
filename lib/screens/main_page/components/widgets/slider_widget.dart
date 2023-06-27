import 'package:aga_lokantasi/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliderWidgetMy extends StatelessWidget {
  final indexMy;
  SliderWidgetMy({required this.indexMy});

  var myArray = [
    "https://images.deliveryhero.io/image/fd-tr/LH/xu7l-hero.jpg",
    "https://www.burgerking.com.tr/cmsfiles/products/whopper-menu.png?v=249",
    "https://img-s1.onedio.com/id-58bff00b8f92ded60e345fc3/rev-0/w-600/h-368/f-jpg/s-da884238dffe19f7a23cc9f71a6e004af1bfee37.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        /*   width: size.width * 0.1,
        height: size.height * 0.2,
       decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kPrimaryBackColor),*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  width: size.width * 1,
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: kPrimaryColor,
                            blurRadius: 4,
                            spreadRadius: 2)
                      ]),
                  child: InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.network(
                        myArray[indexMy],
                        // height: size.height * 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
