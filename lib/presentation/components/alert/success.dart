import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentTypeAlert {
  static showInfo(
    context, {
    String? title,
    String? content,
    String? img,
    double? padding,
    VoidCallback? didTapDetail,
    VoidCallback? didTap,
  }) async {
    return await showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      barrierColor: UIColor.background,
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: null,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    52.h,
                    Center(child: Label(text: title ?? "", size: 28, color: UIColor.black)),
                    const SizedBox(height: 8),
                    Center(
                        child: Label(
                      text: content ?? "",
                      size: 18,
                      color: UIColor.black,
                      align: TextAlign.center,
                    )),
                    36.w,
                    Padding(
                      padding: EdgeInsets.all(padding ?? 40.0),
                      child: Lottie.asset(img ?? Img.success, fit: BoxFit.cover),
                    ),
                    if (didTapDetail != null) ...[
                      const Spacer(flex: 2),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: didTapDetail,
                        child: Center(
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 26,
                                backgroundColor: UIColor.lightGray,
                                child: Icon(
                                  CupertinoIcons.info,
                                  color: UIColor.primary,
                                  size: 28,
                                ),
                              ),
                              4.h,
                              const Label(
                                text: "Ətraflı",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    const Spacer(flex: 2),
                    PrimaryButton(
                      title: "Ana səhifəyə qayıt",
                      onTap: didTap ?? () {},
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
