import 'package:flutter/material.dart';

class AppEdgeInsets {
  ///Padding/Margin All 20
  static const a20 = EdgeInsets.all(20);

  ///Padding/Margin All 15
  static const a15 = EdgeInsets.all(15);

  ///Padding/Margin All 10
  static const a10 = EdgeInsets.all(10);

  ///Padding/Margin All 10
  static const a16 = EdgeInsets.all(16);

  ///Padding/Margin All 5
  static const a5 = EdgeInsets.all(5);

  ///Padding/Margin All 20
  static const a100 = EdgeInsets.all(100);

  ///Padding/Margin Vertical 2 Horizontal 4
  static const v2h4 = EdgeInsets.symmetric(vertical: 2, horizontal: 4);

  ///Padding/Margin Vertical 5 Horizontal 10
  static const v5h10 = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

  ///Padding/Margin Vertical 5 Horizontal 10
  static const v20h20 = EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  ///Padding/Margin Horizontal 5
  static const h5 = EdgeInsets.symmetric(horizontal: 5);

  ///Padding/Margin Horizontal 10
  static const h10 = EdgeInsets.symmetric(horizontal: 10);

  ///Padding/Margin Horizontal 20
  static const h20 = EdgeInsets.symmetric(horizontal: 20);

  ///Padding/Margin Vertical 10
  static const v10 = EdgeInsets.symmetric(vertical: 10);

  ///Padding/Margin Vertical 5
  static const v5 = EdgeInsets.symmetric(vertical: 5);
}

class AppBorderRadius {
  ///BorderRadius Circular 0
  static const a0 = BorderRadius.all(Radius.circular(0));

  ///BorderRadius Circular 5
  static const a5 = BorderRadius.all(Radius.circular(5));

  ///BorderRadius Circular 10
  static const a10 = BorderRadius.all(Radius.circular(10));

  ///BorderRadius Circular 15
  static const a15 = BorderRadius.all(Radius.circular(15));

  ///BorderRadius Circular 20
  static const a20 = BorderRadius.all(Radius.circular(20));

  ///BorderRadius Circular 50
  static const a50 = BorderRadius.all(Radius.circular(50));

  ///BorderRadius radius
  static const b20 = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
}
