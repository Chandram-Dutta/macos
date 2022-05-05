import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos/home.dart';
import 'package:macos/pages/about_page.dart';
import 'package:macos/providers/theme_provider.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosApp(
      title: "MacOS UI",
      theme: ref.watch(appThemeNotifierProvider).appTheme.lightTheme,
      darkTheme: ref.watch(appThemeNotifierProvider).appTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
