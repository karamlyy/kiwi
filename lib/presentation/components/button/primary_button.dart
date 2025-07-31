import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:kiwi/presentation/shared/responsibility.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isEnabled;
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool hasBorder;
  final Color? textColor;
  final FontWeight? fontWeight;
  final bool isLoading;
  final TextDecoration? textDecoration;

  const PrimaryButton({
    super.key,
    required this.title,
    this.isEnabled = true,
    this.onTap,
    this.icon,
    this.isLoading = false,
    this.hasBorder = false,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SizedBox(
        height: context.isTablet ? 70 : 48,
        width: hasBorder ? 100 : null,
        child: Opacity(
          opacity: isEnabled ? 1 : 0.4,
          child: ElevatedButton(
            onPressed: onTap == null
                ? null
                : () {
                    onTap?.call();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: hasBorder ? UIColor.clear : UIColor.primary,
              foregroundColor: UIColor.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shadowColor: UIColor.clear,
              textStyle: const TextStyle(fontSize: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: hasBorder ? (onTap == null ? UIColor.white.withValues(alpha:0.5) : null) : null,
                border: null,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      IconButton(
                        onPressed: onTap,
                        icon: icon ?? const SizedBox.shrink(),
                      )
                    else
                      !isLoading
                          ? Label(
                              decoration: textDecoration ?? TextDecoration.none,
                              text: title,
                              color: !hasBorder ? UIColor.white : UIColor.primary,
                              weight: fontWeight ?? FontWeight.bold,
                              size: context.isTablet ? 24 : 15,
                            )
                          : Center(
                              child: SizedBox(
                                height: context.isTablet ? 50 : 24,
                                width: context.isTablet ? 50 : 24,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(UIColor.white),
                                ),
                              ),
                            ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
