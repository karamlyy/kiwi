import 'package:rxdart/rxdart.dart';

enum UIState {
  initial,
  refreshed,
}

class UIRefreshController {
  final _controllers = {
    'profile': BehaviorSubject<UIState>.seeded(UIState.initial),
  };

  Stream<UIState> get profileControllerStream => _controllers['profile']?.stream ?? const Stream.empty();
  Stream<UIState> get mainControllerStream => _controllers['main']?.stream ?? const Stream.empty();
  Stream<UIState> get settingsControllerStream => _controllers['settings']?.stream ?? const Stream.empty();
  Stream<UIState> get homePageControllerStream => _controllers['homePage']?.stream ?? const Stream.empty();

  void refreshUi() {
    _controllers.forEach((key, controller) => controller.add(UIState.refreshed));
  }
}
