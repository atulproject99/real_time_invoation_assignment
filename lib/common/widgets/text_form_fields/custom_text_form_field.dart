import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_font_size.dart';
import '../custom_sized_boxes.dart';
import '../custom_text_widgets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.maxLength,
    this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.onSaved,
    this.initialValue,
    this.maxLines = 1,
    this.enableSuggestions,
    this.obscureText = false,
    this.textInputAction,
    this.suffixIcon,
    this.controller,
    this.autoValidateMode,
    this.maxHeight,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.title,
    this.fillColor,
    this.cursorColor,
    this.style,
    this.autofocus = false,
    this.onTap,
    this.readOnly,
    this.onFieldSubmitted,
    this.titleWidget,
  });
  final String? title;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final int? maxLines;
  final bool? enableSuggestions;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final double? maxHeight;
  final bool? enabled;
  final TextAlign textAlign;
  final bool? readOnly;
  final Color? fillColor;
  final Color? cursorColor;
  final TextStyle? style;
  final bool autofocus;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? titleWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null || titleWidget != null) ...[
          titleWidget ?? TextRobo16W400(title!),
          const SBH5(),
        ],
        TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly ?? false,
          autofocus: autofocus,
          controller: controller,
          initialValue: initialValue,
          onSaved: onSaved,
          onChanged: (value) => onChanged?.call(value.trim()),
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textAlign: textAlign,
          cursorColor: cursorColor,
          maxLength: maxLength,
          maxLines: maxLines,
          obscureText: obscureText,
          autovalidateMode: autoValidateMode,
          style:
              GoogleFonts.roboto(fontSize: AppSize.size14, color: Colors.black),
          decoration: InputDecoration(
            fillColor: fillColor,
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? AppSize.size40,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            counterText: '',
          ),
        ),
      ],
    );
  }
}
