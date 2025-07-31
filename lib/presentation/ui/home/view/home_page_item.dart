import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? didTap;
  const HomePageItem(
      {super.key, required this.image, required this.text, this.didTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: 0.7,
      onPressed: didTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: UIColor.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: UIColor.white,
              radius: 24,
              child: Image.asset(image, height: 26, width: 26),
            ),
            title: Label(
              text: text,
              size: 16,
              color: UIColor.white,
            ),
            trailing: const Icon(
              CupertinoIcons.right_chevron,
              color: UIColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
