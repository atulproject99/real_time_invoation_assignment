import 'package:flutter/material.dart';
import '../../../../common/enums/role_enums.dart';

import '../../../../common/theme/app_colors.dart';

import '../../../../common/theme/app_geometry.dart';

import '../../../../common/widgets/custom_text_widgets.dart';

class EmployeeRoldBottomSheetWidget extends StatelessWidget {
  const EmployeeRoldBottomSheetWidget(
      {super.key, required this.onRoleSelected});
  final ValueChanged<String> onRoleSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SizedBox(
            height: RoleEnums.values.length * 50,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.darkGrey,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: RoleEnums.values.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _RoleWidget(
                      title: RoleEnums.values[index].value,
                      onTap: () {
                        onRoleSelected(RoleEnums.values[index].value);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleWidget extends StatelessWidget {
  const _RoleWidget({required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
          padding: AppEdgeInsets.v5,
          child: TextRobo16W400(title, textAlign: TextAlign.center)),
    );
  }
}
