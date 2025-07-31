import 'dart:io';

import 'package:kiwi/presentation/shared/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: Platform.isIOS
            ?  CupertinoActivityIndicator(color: color ??  UIColor.black)
            :  CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(color ??UIColor.primary),
              ),
      ),
    );
  }
}
