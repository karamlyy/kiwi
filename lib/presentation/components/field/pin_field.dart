import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class PinField extends StatelessWidget {
  final int maxNumberOfFields;
  final String pin;
  final bool isObscure;
  final String? error;

  const PinField({
    super.key,
    this.maxNumberOfFields = 4,
    this.pin = '',
    required this.isObscure,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < maxNumberOfFields; i++) i].map(
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Center(
              child: index < pin.length
                  ? Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                        color: error != null ? UIColor.red : UIColor.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  : Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                        color: UIColor.grey.withValues(alpha:0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
            ),
          );
        },
      ).toList(),
    );
  }
}
