import 'package:kiwi/app/view/di.dart';
import 'package:kiwi/presentation/shared/shared.dart';
import 'package:kiwi/presentation/ui/home/view/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:kiwi/presentation/ui/profile/view/profile_page.dart';

enum BottomNavBarItem {
  home(Img.home, "home"),
  profile(Img.profile, "profile");

  final String asset;
  final String text;

  const BottomNavBarItem(this.asset, this.text);

  String get title => text.tr();
}

class MainProvider extends ChangeNotifier {
  MainProvider() {
    locator.get<UIRefreshController>().mainControllerStream.listen((event) {
      refresh();
    });
  }
  int _currentIndex = 0;

  String version = "";

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  List<Widget> get pages => _pages;
  List<BottomNavBarItem> get items => BottomNavBarItem.values;
  int get currentIndex => _currentIndex;

  change(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
