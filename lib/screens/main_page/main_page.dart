import 'package:aga_lokantasi/components/background.dart';
import 'package:aga_lokantasi/screens/main_page/components/main_page_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: MainPageView(),
      title: "dada",
      isHome: true,
    );
  }
}
