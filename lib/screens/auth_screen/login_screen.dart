import 'package:flutter/material.dart';
import 'package:movie_app/providers/auth_provider.dart';
import 'package:movie_app/screens/auth_screen/sign_up_screen.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';
import 'package:movie_app/utils/helpers.dart';
import 'package:movie_app/widgets/text_field_container.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: kPadding20,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: SizedBox(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  kVerticalSpace50,
                  const Text(
                    'Hello again, Welcome!',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  kVerticalSpace50,
                  TextFieldContainer(
                    child: TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      autocorrect: false,
                      style: const TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(fontSize: 16.0),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  kVerticalSpace30,
                  TextFieldContainer(
                    child: TextFormField(
                      key: const ValueKey('Password'),
                      controller: _passwordController,
                      autocorrect: false,
                      style: const TextStyle(fontSize: 18.0),
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 16.0),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must have at least 7 characters.';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  kVerticalSpace50,
                  Consumer<AuthProvider>(
                    builder: (ctx, provider, _) {
                      final bool isLoading = provider.isLoading;
                      return isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                _login(context);
                              },
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            );
                    },
                  ),
                  kVerticalSpace10,
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (ctx, animation, animation1) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: const SignUpScreen(),
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1.0),
                  kVerticalSpace10,
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  kVerticalSpace50,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final bool? isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null) {
      if (isValid) {
        _formKey.currentState?.save();
        final String email = _emailController.text.trim();
        final String password = _passwordController.text.trim();
        await _authProvider.logIn(email, password).then((value) {
          Navigator.pushReplacement(
            context,
            Helper.customTransition(const HomeScreen()),
          );
        }).catchError((error) {
          Helper.snackBar(error, context);
        });
      }
    }
  }
}
