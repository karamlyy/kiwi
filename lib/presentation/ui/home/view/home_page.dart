import 'package:kiwi/presentation/router/navigation.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/home/view/home_page_item.dart';
import 'package:kiwi/presentation/ui/main/provider/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(
                    size: 20,
                    weight: FontWeight.w600,
                    text: L10n.main,
                  ),
                ],
              ),
              24.h,
              HomePageItem(
                image: Img.pay,
                text: 'Item 1',
                didTap: () => Navigation.push(RouteName.adoptPayment),
              ),
              16.h,
              HomePageItem(
                image: Img.history,
                text: 'Item 2',
                didTap: () => Navigation.push(RouteName.paymentHistory),
              ),
            ],
          ),
        ),
      );
    });
  }
}
