import 'package:aga_lokantasi/components/background.dart';
import 'package:aga_lokantasi/screens/main_page/components/main_page_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/shopping_cart_page_view.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ShoppingCartView(),
      title: "Sepetim",
      isHome: true,
    );
  }
}
