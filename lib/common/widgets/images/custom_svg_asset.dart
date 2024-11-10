import 'package:flutter/material.dart';
import '../../extensions/size_extension.dart';

import 'package:flutter_svg/svg.dart';

class CustomSvgAsset extends StatelessWidget {
  /// Takes ImagePath [svg], default height and width = 30
  const CustomSvgAsset(
      {super.key,
      required this.imagePath,
      this.height = 15,
      this.width = 15,
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
      child: SvgPicture.asset(
        imagePath,
        height: height.sp,
        width: width.sp,
      ),
    );
  }
}
