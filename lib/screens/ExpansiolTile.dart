import 'package:flutter/material.dart';

import '../components/background.dart';
import 'main_page/components/main_page_view.dart';

class ExpansionTileExamplePage extends StatefulWidget {
  @override
  State<ExpansionTileExamplePage> createState() =>
      _ExpansionTileExamplePageState();
}

class _ExpansionTileExamplePageState extends State<ExpansionTileExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ExpansionTileExample(),
      title: "Anasayfa",
      isHome: true,
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample();

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const ExpansionTile(
            title: Text('Randevu al'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
          ),
          ExpansionTile(
            title: const Text('Doktor Araştır'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 800,
                child: Row(
                  children: [Text("deneme")],
                ),
              ),
              ElevatedButton(
                  onPressed: () => print("oldu"), child: Text("oldu yazacak")),
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          const ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
        ],
      ),
    );
  }
}
