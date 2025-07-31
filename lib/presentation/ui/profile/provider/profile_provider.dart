import 'package:flutter/cupertino.dart';
import 'package:kiwi/app/view/di.dart';
import 'package:kiwi/presentation/shared/ui_refresh_controller.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    locator.get<UIRefreshController>().profileControllerStream.listen((_) {});
  }

  String? userName = "Karam";
}
