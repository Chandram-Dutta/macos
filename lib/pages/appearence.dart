import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos/providers/theme_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class AppearencePage extends ConsumerWidget {
  const AppearencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Appearence'),
      ),
      children: [
        ResizablePane(
          minWidth: 200,
          startWidth: 200,
          windowBreakpoint: 700,
          resizableSide: ResizableSide.left,
          builder: (_, __) {
            return const SizedBox();
          },
        ),
        ContentArea(
          builder: (context, controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  const Text("Theme"),
                  const Spacer(),
                  MacosPopupButton<String>(
                    value: ref.watch(appThemeDropDownProvider),
                    onChanged: (String? newValue) {
                      if (newValue == 'System') {
                        ref
                            .read(appThemeNotifierProvider.notifier)
                            .changeDefaultTheme();
                        ref.watch(appThemeDropDownProvider.state).state =
                            "System";
                      } else if (newValue == 'Light') {
                        ref.read(appThemeNotifierProvider).changeLightTheme();
                        ref.read(appThemeDropDownProvider.state).state =
                            "Light";
                      } else if (newValue == 'Dark') {
                        ref.read(appThemeNotifierProvider).changeDarkTheme();
                        ref.read(appThemeDropDownProvider.state).state = "Dark";
                      }
                    },
                    items: <String>[
                      'System',
                      'Light',
                      'Dark',
                    ].map<MacosPopupMenuItem<String>>((String value) {
                      return MacosPopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),
            );
          },
        ),
        ResizablePane(
          minWidth: 200,
          startWidth: 200,
          windowBreakpoint: 700,
          resizableSide: ResizableSide.right,
          builder: (_, __) {
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
