import 'package:aga_lokantasi/components/background.dart';
import 'package:aga_lokantasi/screens/main_page/components/main_page_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, dynamic> food;

  const FoodDetailPage({
    required this.food,
  });
  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: MainPageView(),
      title: widget.food['name'],
      isHome: true,
    );
  }
}
