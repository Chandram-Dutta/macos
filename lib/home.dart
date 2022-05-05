import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos/providers/name_email_providers.dart';
import 'package:macos/providers/page_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosWindow(
      sidebar: Sidebar(
        topOffset: 0,
        builder: (context, controller) {
          return SidebarItems(
              currentIndex: ref.watch(pageIndexProvider),
              onChanged: (i) => ref.read(pageIndexProvider.state).state = i,
              scrollController: controller,
              items: const [
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.wifi),
                  label: Text('Wifi'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.globe),
                  label: Text('Network'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.bluetooth),
                  label: Text('Bluetooth'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.eye_fill),
                  label: Text('Appearence'),
                ),
              ]);
        },
        bottom: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MacosListTile(
            leading: const MacosIcon(CupertinoIcons.person_crop_circle),
            title: Text(ref.watch(nameProvider)),
            subtitle: Text(ref.watch(emailProvider)),
            onClick: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ),
        minWidth: 250,
      ),
      child: IndexedStack(
        index: ref.watch(pageIndexProvider),
        children: ref.watch(pageProvider),
      ),
    );
  }
}
