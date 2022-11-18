import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        title: const Center(
          child: Text('My Profile'),
        ),
      ),
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pop();
        }),
      ],
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
      avatarSize: 54,
    );
  }
}
