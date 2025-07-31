import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringX on String {
  String get lastRemoved {
    return substring(0, length - 1);
  }

  String get regExpAmount {
    return replaceAll(RegExp(r'\B(?=(\d{2})+(?!\d))'), ",");
  }

  String get formatDate {
    DateTime dateTime = DateTime.parse(this);
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }

  String get formatMoney {
    final formatter = NumberFormat.currency(
      locale: "az_AZ",
      decimalDigits: 2,
    );
    final value = double.tryParse(replaceAll(',', '.'));
    return formatter.format((value ?? 0) / 100);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})+$',
    );
    return emailRegExp.hasMatch(this);
  }
}

extension EitherX<L, T> on Either<L, T> {
  T asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}
