import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos/pages/appearence.dart';
import 'package:macos_ui/macos_ui.dart';

final pageProvider = Provider<List<Widget>>((ref) {
  return [
    const Center(
      child: MacosIcon(CupertinoIcons.wifi),
    ),
    const Center(
      child: MacosIcon(CupertinoIcons.globe),
    ),
    const Center(
      child: MacosIcon(CupertinoIcons.bluetooth),
    ),
    const AppearencePage()
  ];
});

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
