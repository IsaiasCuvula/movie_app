import 'package:flutter/material.dart';
import 'package:movie_app/providers/auth_provider.dart';
import 'package:movie_app/screens/auth_screen/welcome_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              _signOut(context);
            },
            icon: const Icon(Icons.exit_to_app_sharp),
          )
        ],
      ),
    );
  }

  void _signOut(BuildContext context) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    provider.signOut().then((value) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (ctx, animation, animation1) {
            return FadeTransition(
              opacity: animation,
              child: const WelcomeScreen(),
            );
          },
        ),
      );
    });
  }
}
