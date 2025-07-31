import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:kiwi/presentation/shared/responsibility.dart';
import 'package:kiwi/presentation/shared/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final bool? isEditable;
  final String? headText;
  final String? error;
  final bool readOnly;
  final bool? isObscure;
  final Color? backgroundColor;
  final VoidCallback? onTapSuffix;
  final String? initialValue;
  final TextInputAction? inputAction;
  final Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final Color? fillColor;

  final bool filled;
  final bool hasError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffix;
  final String? hintText;
  final bool hasBorder;
  final int? minLength;
  final int? maxLine;
  final int? minLine;
  final List<TextInputFormatter>? inputFormatters;
  final double? textSize;
  final FocusNode? focusNode;
  final FontWeight? fontWeight;
  final Widget? prefix;

  const PrimaryTextField({
    super.key,
    this.onTextChanged,
    this.textSize,
    this.backgroundColor,
    this.hasBorder = false,
    this.suffix,
    this.autoFocus = false,
    this.isObscure,
    this.isEditable,
    this.hasError = false,
    this.error,
    this.initialValue,
    this.inputAction,
    this.onSubmit,
    this.onTapSuffix,
    this.headText,
    this.onTap,
    this.focusNode,
    this.fontWeight = FontWeight.w400,
    this.controller,
    this.readOnly = false,
    this.filled = true,
    this.fillColor,
    this.keyboardType,
    this.maxLength,
    this.hintText,
    this.prefix,
    this.minLength,
    this.minLine,
    this.maxLine,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (headText != null) ...[
          Label(
            text: headText,
            size: context.isTablet ? 24 : 16,
            color: UIColor.black,
          ),
          8.h,
        ],
        TextFormField(
          obscureText: isObscure ?? false,
          onChanged: onTextChanged,
          focusNode: focusNode,
          autofocus: autoFocus,
          inputFormatters: inputFormatters,
          enabled: isEditable,
          obscuringCharacter: "*",
          initialValue: initialValue,
          textInputAction: inputAction,
          onFieldSubmitted: onSubmit,
          onTap: onTap,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: context.isTablet ? textSize ?? 24 : 14,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          controller: controller,
          keyboardType: keyboardType,
          minLines: minLine ?? 1,
          maxLength: maxLength,
          maxLines: maxLine ?? 1,
          buildCounter: (context, {required currentLength, required isFocused, maxLength}) {
            return maxLength != null
                ? Container(
                    transform: Matrix4.translationValues(2, -30, 0),
                    child: Label(
                      text: "$currentLength/$maxLength",
                      size: 12,
                      color: UIColor.black.withValues(alpha:0.6),
                    ),
                  )
                : null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: prefix,
            hintText: hintText,
            hintStyle: TextStyle(
              color: UIColor.black.withValues(alpha:0.4),
              fontSize: context.isTablet ? 24 : 14,
            ),
            fillColor: backgroundColor ?? UIColor.white,
            filled: filled,
            isDense: true,
            errorText: error,
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: suffix != null
                ? GestureDetector(
                    onTap: onTapSuffix,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: suffix,
                    ),
                  )
                : null,
            border: !hasBorder ? borderWith() : borderRadius(),
            errorBorder: borderWith(color: UIColor.red),
            focusedErrorBorder: borderWith(color: UIColor.red),
            errorStyle: const TextStyle(color: UIColor.red),
            disabledBorder: !hasBorder ? borderWith() : borderRadius(),
            enabledBorder: !hasBorder ? borderWith() : borderRadius(),
            focusedBorder: !hasBorder ? borderWith(color: UIColor.primary) : borderRadius(),
          ),
        ),
        if (headText != null) 16.h,
      ],
    );
  }

  borderWith({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: (color ?? UIColor.background),
        width: error != null ? 1 : 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }

  borderRadius() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: UIColor.clear),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
