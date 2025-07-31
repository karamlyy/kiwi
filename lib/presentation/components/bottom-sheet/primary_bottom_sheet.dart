import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryBottomSheet {
  static show(
    context, {
    String? text,
    VoidCallback? didTap,
    List<PrimaryButton>? buttons,
    bool isDismissible = true,
  }) async {
    return await showModalBottomSheet(
      context: context,
      barrierColor: UIColor.black.withValues(alpha:0.3),
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.fastEaseInToSlowEaseOut,
        reverseDuration: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        splashRadius: 22,
                        onPressed: didTap ?? () => Navigation.pop(),
                        icon: const Icon(CupertinoIcons.clear),
                      ),
                    ),
                  ),
                  if (text != null)
                    Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  if (text != null) 30.h,
                  if (buttons != null)
                    for (var i in buttons) ...[
                      i,
                      8.h,
                    ],
                  30.h,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
