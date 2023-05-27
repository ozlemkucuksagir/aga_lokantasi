import 'package:aga_lokantasi/components/constant.dart';
import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
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
            )
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
