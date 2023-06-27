import 'package:aga_lokantasi/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterWidget extends StatefulWidget {
  int counter;
  CounterWidget({required this.counter});
  int get getCounter => counter;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    int currentCounter = widget.counter;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: cardColor,
          boxShadow: [
            BoxShadow(color: kPrimaryColor, blurRadius: 3, spreadRadius: 1)
          ]),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  if (widget.counter > 1) {
                    widget
                        .counter--; //TODO populerFoodsStatic[index]['counter'] GÜNCELLENMESİ
                  } else {
                    Fluttertoast.showToast(
                        msg: "1'den az seçemezsiniz",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red);
                  }

                  print("azal");
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Icon(
                  Icons.remove,
                  color: kPrimary2Color,
                  size: 12,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            decoration: BoxDecoration(color: kPrimary2Color),
            child: Text(
              "${widget.counter}", //TODO populerFoodsStatic[index]['counter'] GÜNCELLENMESİ
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  widget.counter++;
                  print(
                      "art"); //TODO populerFoodsStatic[index]['counter'] GÜNCELLENMESİ
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Icon(
                  Icons.add,
                  color: kPrimary2Color,
                  size: 12,
                ),
              )),
        ],
      ),
    );
  }
}
