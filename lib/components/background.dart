import 'package:aga_lokantasi/components/constant.dart';
import 'package:aga_lokantasi/screens/shopping_cart_page/shopping_cart_page.dart';
import 'package:flutter/material.dart';

import '../screens/shopping_cart_page/components/shopping_cart_page_view.dart';
import '../widgets/navigation_bar.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool isHome;
  const Background({
    Key? key,
    required this.child,
    required this.title,
    this.isHome = false,
    this.topImage = "assets/logo/AgaLogo.png",
    //this.bottomImage = "assets/images/backgroundOrange.png",
  }) : super(key: key);

  final String topImage; // bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Row(
                children: [
                  isHome
                      ? Image.asset(
                          'assets/logo/AgaLogo.png',
                          fit: BoxFit.fitHeight,
                          height: 60,
                        )
                      : Text(""),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${title}',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "5 TL", //TODO backendden gelen sepetin total fiyatı yazılacak initin içinde çağır ki sürekli güncellensin setstatede.
                  style: TextStyle(fontSize: 12),
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // İkon tıklandığında yapılacak işlemler buraya gelecek
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationBarMy(index: 1)));
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: kPrimaryLightColor,
      ),
      // bottomNavigationBar:
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              //kPrimaryMidColor,
              kPrimaryLightColor,
              Colors.white,
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            /* Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset(
                bottomImage,
              ),
              width: 1000,
            ),*/
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
