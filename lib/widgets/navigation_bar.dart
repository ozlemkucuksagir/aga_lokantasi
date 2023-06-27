import 'package:aga_lokantasi/components/constant.dart';
import 'package:aga_lokantasi/screens/main_page/main_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import '../screens/shopping_cart_page/shopping_cart_page.dart';

class NavigationBarMy extends StatefulWidget {
  int index;

  NavigationBarMy({
    this.index = 0,
  });

  @override
  _NavigationBarMyState createState() => _NavigationBarMyState();
}

class _NavigationBarMyState extends State<NavigationBarMy> {
  @override
  void initState() {
    super.initState();
  }

  // bool isLogin = true;
  int currentIndex = 0;
  final screens = [
    MainPage(), ShoppingCartPage(),
    //  ProfileScreen(),
  ];
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[isLogin ? widget.index : 0],
      bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: isLogin ? widget.index : 0,
          backgroundColor: kNavBarBackColor,
          color: kNavBarColor,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => setState(() {
                isLogin == false && index != 0
                    ? showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Wrong"),
                          content: Text("Please Login first."),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage())),
                                child: Text("Login")),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel")),
                          ],
                        ),
                        barrierDismissible: false,
                      )
                    : null;
                widget.index = index;
              }),
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Visibility(
              visible: true,
              child: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
