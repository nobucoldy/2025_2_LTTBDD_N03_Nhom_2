import 'package:flutter/material.dart';
import '../data/language_data.dart';

class AlertUtils {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
    String locale = 'vi',
  }) {
    String t(String key) => localizedText[locale]?[key] ?? key;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                isError ? Icons.error_rounded : Icons.check_circle_rounded,
                color: isError ? Colors.red : Colors.green,
              ),
              const SizedBox(width: 10),
              Text(isError ? t('alert_error_title') : t('alert_success_title')),
            ],
          ),
          content: Text(message, style: const TextStyle(fontSize: 15)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                t('btn_close'),
                style: TextStyle(
                  color: isError ? Colors.red : Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
