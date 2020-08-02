import 'package:flutter/material.dart';

class ItemData {
  Color color;
  final String head;
  String text;
  String title;
  final String link;

  ItemData(this.color, this.head, this.text, this.title, this.link);

  static List<ItemData> data = [
    ItemData(
      Color(0xff3a0088),
      "Column",
      "A widget that displays its children in a vertical array. The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.",
      "widgets",
      "https://api.flutter.dev/flutter/widgets/Column-class.html",
    ),
    ItemData(
      Color(0xff930077),
      "Animated Container",
      "Animated version of Container that gradually changes its values over a period of time. The AnimatedContainer will automatically animate between the old and new values of properties when they change using the provided curve and duration. Properties that are null are not animated. Its child and descendants are not animated.",
      "used",
      "https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html",
    ),
    ItemData(
      Color(0xffe61c5d),
      "Row",
      "A widget that displays its children in a horizontal array. To cause a child to expand to fill the available horizontal space, wrap the child in an Expanded widget. If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.",
      "for",
      "https://api.flutter.dev/flutter/widgets/Row-class.html",
    ),
    ItemData(
      Color(0xffffbd39),
      "Stack",
      "A widget that positions its children relative to the edges of its box. This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.",
      "this",
      "https://api.flutter.dev/flutter/widgets/Stack-class.html",
    ),
    ItemData(
      Color(0xff4ecca3),
      "A Lot More",
      "I have used a lot of Widgets like Text, Container, AnimatedOpacity, Centre etc., for this UI and they all have there unique properties.\nYou can find about WIDGETS in the link below.",
      "layout",
      "https://flutter.dev/docs/development/ui/widgets-intro",
    ),
  ];
}
