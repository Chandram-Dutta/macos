import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class AppTheme {
  MacosThemeData lightTheme;
  MacosThemeData darkTheme;

  AppTheme({
    required this.lightTheme,
    required this.darkTheme,
  });
}

class AppThemeNotifier extends ChangeNotifier {
  final appTheme = AppTheme(
    lightTheme: MacosThemeData.light(),
    darkTheme: MacosThemeData.dark(),
  );

  void changeLightTheme() {
    appTheme.lightTheme = MacosThemeData.light();
    appTheme.darkTheme = MacosThemeData.light();
    notifyListeners();
  }

  void changeDarkTheme() {
    appTheme.lightTheme = MacosThemeData.dark();
    appTheme.darkTheme = MacosThemeData.dark();
    notifyListeners();
  }

  void changeDefaultTheme() {
    appTheme.lightTheme = MacosThemeData.light();
    appTheme.darkTheme = MacosThemeData.dark();
    notifyListeners();
  }
}

final appThemeNotifierProvider =
    ChangeNotifierProvider<AppThemeNotifier>((ref) {
  return AppThemeNotifier();
});

final appThemeDropDownProvider = StateProvider<String>((ref) {
  return "System";
});
