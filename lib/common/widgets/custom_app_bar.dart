import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_font_size.dart';
import 'custom_text_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackIcon = true,
  });
  final bool showBackIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: !showBackIcon
          ? null
          : UnconstrainedBox(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
      title: TextRobo18W500(
        title,
        color: AppColors.white,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.size54);
}
