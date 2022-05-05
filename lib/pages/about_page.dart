import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos/providers/name_email_providers.dart';
import 'package:macos/services/url_launcher.dart';
import 'package:macos_ui/macos_ui.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();

    TextEditingController emailController = TextEditingController();
    return MacosScaffold(
      toolBar: const ToolBar(
        leading: MacosBackButton(
          fillColor: Colors.transparent,
        ),
        title: Text('About'),
      ),
      children: [
        ContentArea(
          builder: (context, controller) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.person_crop_circle,
                        size: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ref.watch(nameProvider)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MacosIconButton(
                              semanticLabel: "Edit Name",
                              shape: BoxShape.circle,
                              boxConstraints: const BoxConstraints(
                                minHeight: 15,
                                minWidth: 15,
                              ),
                              icon: const MacosIcon(
                                CupertinoIcons.pen,
                              ),
                              onPressed: () {
                                showMacosAlertDialog(
                                  context: context,
                                  builder: (_) => MacosAlertDialog(
                                    appIcon: const Icon(
                                      CupertinoIcons.person_crop_circle,
                                      size: 50,
                                    ),
                                    title: Text(
                                      'Change Username',
                                      style: MacosTheme.of(context)
                                          .typography
                                          .headline,
                                    ),
                                    message: Column(
                                      children: [
                                        Text(
                                          'Enter your new username',
                                          textAlign: TextAlign.center,
                                          style: MacosTheme.of(context)
                                              .typography
                                              .headline,
                                        ),
                                        const SizedBox(height: 5),
                                        MacosTextField(
                                          placeholder: ref.watch(nameProvider),
                                          controller: nameController,
                                        )
                                      ],
                                    ),
                                    primaryButton: PushButton(
                                      buttonSize: ButtonSize.large,
                                      child: const Text('Done'),
                                      onPressed: () {
                                        ref.read(nameProvider.state).state =
                                            nameController.text;

                                        Navigator.pop(context);
                                      },
                                    ),
                                    secondaryButton: PushButton(
                                      buttonSize: ButtonSize.large,
                                      child: const Text('Cancel'),
                                      isSecondary: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ref.watch(emailProvider)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MacosIconButton(
                              semanticLabel: "Edit Email ID",
                              shape: BoxShape.circle,
                              boxConstraints: const BoxConstraints(
                                minHeight: 15,
                                minWidth: 15,
                              ),
                              icon: const MacosIcon(
                                CupertinoIcons.pen,
                              ),
                              onPressed: () {
                                showMacosAlertDialog(
                                  context: context,
                                  builder: (_) => MacosAlertDialog(
                                    appIcon: const Icon(
                                      CupertinoIcons.person_crop_circle,
                                      size: 50,
                                    ),
                                    title: Text(
                                      'Change Email ID',
                                      style: MacosTheme.of(context)
                                          .typography
                                          .headline,
                                    ),
                                    message: Column(
                                      children: [
                                        Text(
                                          'Enter your new email id',
                                          textAlign: TextAlign.center,
                                          style: MacosTheme.of(context)
                                              .typography
                                              .headline,
                                        ),
                                        const SizedBox(height: 5),
                                        MacosTextField(
                                          placeholder: ref.watch(emailProvider),
                                          controller: emailController,
                                        )
                                      ],
                                    ),
                                    primaryButton: PushButton(
                                      buttonSize: ButtonSize.large,
                                      child: const Text('Done'),
                                      onPressed: () {
                                        ref.read(emailProvider.state).state =
                                            emailController.text;

                                        Navigator.pop(context);
                                      },
                                    ),
                                    secondaryButton: PushButton(
                                      buttonSize: ButtonSize.large,
                                      child: const Text('Cancel'),
                                      isSecondary: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PushButton(
                        buttonSize: ButtonSize.large,
                        child: const Text('About the App'),
                        onPressed: () {
                          showMacosAlertDialog(
                            context: context,
                            builder: (_) => MacosAlertDialog(
                              appIcon: const FlutterLogo(
                                size: 56,
                              ),
                              title: Text(
                                'Built on Flutter 2.10.5',
                                style:
                                    MacosTheme.of(context).typography.headline,
                              ),
                              message: Text(
                                'MIT License \nCopyright © 2022 Chandram Dutta \nThanks GroovinChip for the amazing MacOS UI Package.',
                                textAlign: TextAlign.center,
                                style:
                                    MacosTheme.of(context).typography.headline,
                              ),
                              primaryButton: PushButton(
                                buttonSize: ButtonSize.large,
                                child: const Text(
                                    'MacOS UI Package(macos_ui @ pub.dev)'),
                                onPressed: () {
                                  launchUrl(
                                      "https://pub.dev/packages/macos_ui");
                                },
                              ),
                              secondaryButton: PushButton(
                                buttonSize: ButtonSize.large,
                                child: const Text('Ok'),
                                isSecondary: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
