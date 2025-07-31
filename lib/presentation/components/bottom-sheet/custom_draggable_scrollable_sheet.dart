import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/label.dart';
import 'package:kiwi/presentation/shared/size.dart';
import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet {
  static show(
    context, {
    String? text,
    VoidCallback? didTap,
    List<Widget>? children,
    bool isDismissible = true,
  }) async {
    return await showModalBottomSheet(
      context: context,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.fastEaseInToSlowEaseOut,
        reverseCurve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 300),
      ),
      barrierColor: UIColor.black.withValues(alpha: 0.1),
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: Column(
                children: [
                  12.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: Container(height: 4.57, color: UIColor.black.withValues(alpha: 0.1)),
                  ),
                  16.h,
                  const Label(
                    text: "Filter",
                    size: 20,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: children ?? [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
