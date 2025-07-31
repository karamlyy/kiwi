import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends AppBar {
  final bool isLeading;
  final String? titleText;
  final FileImage? newImageFile;
  final List<Widget>? trailing;
  final VoidCallback? onTap;
  final String? subtitle;
  final BuildContext context;

  PrimaryAppBar(
    this.context, {
    super.key,
    this.subtitle,
    this.titleText,
    this.onTap,
    this.isLeading = false,
    this.newImageFile,
    this.trailing,
  });

  @override
  Widget? get leading {
    return isLeading
        ? IconButton(
            onPressed: onTap ?? () => Navigation.pop(result: true),
            icon: const Icon(Icons.arrow_back_ios),
          )
        : null;
  }

  @override
  bool? get centerTitle => true;

  @override
  Widget? get title {
    if (titleText == null) return null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Label(
          text: titleText,
          color: UIColor.black,
          size: context.isTablet ? 36 : 24,
          weight: FontWeight.w600,
        ),
        if (subtitle != null) ...[
          6.h,
          Label(
            text: subtitle,
            color: UIColor.black.withValues(alpha: 0.7),
            size: context.isTablet ? 16 : 12,
            weight: FontWeight.w400,
          ),
        ],
      ],
    );
  }

  @override
  List<Widget>? get actions => trailing;
}
