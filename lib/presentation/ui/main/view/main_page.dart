import 'package:kiwi/presentation/components/navbar/primary_bottom_navigation_bar.dart';
import 'package:kiwi/presentation/ui/main/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    return Scaffold(
      appBar: null,
      body: LazyLoadIndexedStack(
        index: mainProvider.currentIndex,
        children: mainProvider.pages,
      ),
      bottomNavigationBar: const PrimaryBottomNavigationBar(),
    );
  }
}
