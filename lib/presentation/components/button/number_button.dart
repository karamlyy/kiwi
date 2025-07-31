import 'dart:io';

import 'package:kiwi/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String? pinTitle;
  final KeywordNumber? char;
  final VoidCallback? onTap;
  final bool? isVisible;
  const NumberButton({
    super.key,
    this.pinTitle,
    this.char,
    this.onTap,
    this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: pinTitle == "-1" || pinTitle == "-2" ? UIColor.white : UIColor.lightGray,
          shape: BoxShape.circle,
        ),
        child: pinTitle == "-1"
            ? Visibility(
                visible: isVisible ?? true,
                child: Image.asset(
                  Platform.isAndroid ? Img.fingerPrint : Img.faceId,
                  height: 30,
                  color: UIColor.black,
                ),
              )
            : pinTitle == "-2"
                ? const Icon(Icons.backspace_outlined, size: 24)
                : Center(
                    child: Label(
                      text: pinTitle ?? "",
                      size: 24,
                    ),
                  ),
      ),
    );
  }
}
