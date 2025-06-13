import 'package:flutter/material.dart';

class MaeRHelperFunctions {
  final BuildContext context;

  MaeRHelperFunctions(this.context);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void showAlert(String title, String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tamam'),
              ),
            ],
          ),
    );
  }

  void oncekiSayfayaGit() {
    Navigator.pop(context);
  }

  void sonrakiSayfayaGit(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  void sonrakiSayfayaGitEskiniKapat(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  bool get isDarkMode => Theme.of(context).brightness == Brightness.dark;

  Size get screenSize => MediaQuery.of(context).size;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }
}
