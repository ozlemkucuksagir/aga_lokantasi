import 'package:aga_lokantasi/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  int counter = 1;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kPrimary2Color),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  if (counter > 1) {
                    counter--;
                  } else {
                    Fluttertoast.showToast(
                        msg: "1'den az seçemezsiniz",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red);
                  }

                  print("azal");
                });
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 14,
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Text(
              "$counter",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  counter++;
                  print("art");
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 14,
              )),
        ],
      ),
    );
  }
}
