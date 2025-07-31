import 'package:kiwi/presentation/components/button/primary_button.dart';
import 'package:kiwi/presentation/components/field/primary_text_field.dart';
import 'package:flutter/material.dart';

class Alert {
  static showError(
    context, {
    String? title = "Error",
    String? content,
    String? headText,
    List<PrimaryButton>? buttons,
    List<PrimaryTextField>? textFields,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Error"),
          content: Text(content ?? ""),
          actions: [
            PrimaryButton(
              title: "Ok",
              hasBorder: true,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
