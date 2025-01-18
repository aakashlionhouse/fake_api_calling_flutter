import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;

  const ProfilePage({Key? key, required this.username, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username: $username", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Email: $email", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text("Welcome to your profile!", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
