import 'package:kiwi/presentation/components/navbar/primary_bottom_navigation_bar_item.dart';
import 'package:kiwi/presentation/shared/color.dart';
import 'package:kiwi/presentation/shared/responsibility.dart';
import 'package:kiwi/presentation/ui/main/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryBottomNavigationBar extends StatelessWidget {
  const PrimaryBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    final items = mainProvider.items;
    return PopScope(
      canPop: mainProvider.currentIndex == 0 ? true : false,
      onPopInvokedWithResult: (_, result) {
        mainProvider.change(0);
      },
      child: BottomNavigationBar(
        currentIndex: mainProvider.currentIndex,
        items: items.map((item) {
          return BottomNavigationBarItem(
            icon: PrimaryBottomNavigationBarItem(
              icon: item.asset,
              text: item.title,
            ),
            activeIcon: PrimaryBottomNavigationBarItem(
              icon: item.asset,
              height: context.isTablet ? 36 : 28,
              color: UIColor.primary,
              index: mainProvider.currentIndex,
              isActive: true,
              textSize: context.isTablet ? 20 : 13,
              text: item.title,
            ),
            label: "",
          );
        }).toList(),
        onTap: (index) {
          mainProvider.change(index);
          HapticFeedback.lightImpact();
        },
      ),
    );
  }
}
