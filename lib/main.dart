import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/item_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color temp;
  int selectedIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = ItemData.data[0].color;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown,
        body: AnimatedContainer(
          width: double.infinity,
          height: double.infinity,
          duration: const Duration(
            milliseconds: 600,
          ),
          color: temp.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: List.generate(
                ItemData.data.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      temp = ItemData.data[index].color;
                    });
                  },
                  child: ExpandedItem(
                      ItemData.data[index].color,
                      selectedIndex == -1
                          ? MediaQuery.of(context).size.height * 0.15
                          : selectedIndex == index
                              ? MediaQuery.of(context).size.height * 0.75
                              : 0.0,
                      ItemData.data[index].title,
                      selectedIndex == -1 ? false : true,
                      ItemData.data[index].head,
                      ItemData.data[index].text, () {
                    setState(() {
                      selectedIndex = -1;
                    });
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedItem extends StatefulWidget {
  Color color;
  double height;
  String title;
  bool expanded;
  String head;
  String text;
  Function onCancelTap;
  ExpandedItem(this.color, this.height, this.title, this.expanded, this.head,
      this.text, this.onCancelTap);

  @override
  _ExpandedItemState createState() => _ExpandedItemState();
}

class _ExpandedItemState extends State<ExpandedItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width * 0.90,
      height: widget.height,
      duration: Duration(milliseconds: 900),
      curve: Curves.fastOutSlowIn,
      color: widget.color,
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: widget.expanded ? 0 : 1,
            child: Center(
              child: Text(
                widget.title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 600),
            opacity: widget.expanded ? 1 : 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.head,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 10.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                      onPressed: widget.onCancelTap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
