import 'package:kiwi/data/endpoint/auth/login_endpoint.dart';
import 'package:kiwi/presentation/shared/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = false;
  String _userName = "";
  String _password = "";

  String? _userNameError;
  String? _passwordError;

  FocusNode? _focusNode;

  FocusNode get focusNode => _focusNode!;

  String? get userNameError => _userNameError;
  String? get passwordError => _passwordError;

  bool get isObscure => _isObscure;

  bool get isFormValid {
    final isFormValid = _userNameError == null && _passwordError == null;
    final isNotEmpty = _userName.isNotEmpty && _password.isNotEmpty;
    return isFormValid && isNotEmpty;
  }

  LoginInput get input => LoginInput(
        username: _userName,
        password: _password,
      );

  void changeObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  updateUserName(String value) {
    _userName = value;
    if (value.length < 3) {
      _userNameError = L10n.userNameLengthError;
    } else {
      _userNameError = null;
    }
    notifyListeners();
  }

  updatePassword(String value) {
    _password = value;

    if (value.length < 5) {
      _passwordError = L10n.passError;
    } else {
      _passwordError = null;
    }
    _focusNode?.requestFocus();
    notifyListeners();
  }
}
