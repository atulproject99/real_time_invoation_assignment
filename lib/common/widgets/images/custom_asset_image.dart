import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  /// Takes ImagePath [png,jpg], default height and width = 30
  const CustomAssetImage(
      {super.key,
      required this.imagePath,
      this.height = 25,
      this.width = 25,
      this.onTap,
      this.fit});
  final String imagePath;
  final double height;
  final double width;
  final GestureTapCallback? onTap;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
