import 'package:flutter/material.dart';

import '../../theme/app_font_size.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key,
      this.onTap,
      this.height,
      this.width,
      required this.text,
      this.child,
      this.textColor,
      this.color});
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final String text;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppSize.size40,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            elevation: WidgetStateProperty.all(0),
            backgroundColor:
                color != null ? WidgetStateProperty.all<Color>(color!) : null),
        child: child ??
            Text(
              text,
              maxLines: 1,
              style: TextStyle(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }
}
