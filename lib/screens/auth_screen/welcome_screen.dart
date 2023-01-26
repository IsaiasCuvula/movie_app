import 'package:flutter/material.dart';
import 'package:movie_app/screens/auth_screen/sign_up_screen.dart';

import '../../utils/constants.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceSize.width,
          padding: kPadding20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Never miss any movie again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kVerticalSpace60,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (ctx, animation, animation1) {
                        return FadeTransition(
                          opacity: animation,
                          child: const SignUpScreen(),
                        );
                      },
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (ctx, animation, animation1) {
                            return FadeTransition(
                              opacity: animation,
                              child: const LoginScreen(),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
