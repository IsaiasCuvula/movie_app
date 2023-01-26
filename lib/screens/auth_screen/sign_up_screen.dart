import 'package:flutter/material.dart';
import 'package:movie_app/screens/auth_screen/login_screen.dart';
import 'package:movie_app/utils/helpers.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/text_field_container.dart';
import '../home_screen/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kVerticalSpace50,
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kVerticalSpace16,
                  const Text(
                    'Watch all your favourite movies today!',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  kVerticalSpace50,
                  TextFieldContainer(
                    child: TextFormField(
                      controller: _usernameController,
                      key: const ValueKey('UsernameText'),
                      style: const TextStyle(fontSize: 18.0),
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(fontSize: 16.0),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please, enter at least 4 character for user name.';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  kVerticalSpace30,
                  TextFieldContainer(
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(fontSize: 18.0),
                      autocorrect: false,
                      key: const ValueKey('EmailText'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
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
                      controller: _passwordController,
                      key: const ValueKey('PasswordText'),
                      style: const TextStyle(fontSize: 18.0),
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  kVerticalSpace16,
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms and conditions',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  kVerticalSpace16,
                  Consumer<AuthProvider>(
                    builder: (ctx, provider, _) {
                      final bool isLoading = provider.isLoading;
                      return isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                _signUp(context);
                              },
                              child: const Center(
                                child: Text(
                                  'Create Account',
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
                        'Already have an account?',
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
                                  child: const LoginScreen(),
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  kVerticalSpace50
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context) async {
    final bool? isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid != null) {
      if (isValid) {
        _formKey.currentState?.save();
        final String username = _usernameController.text.trim();
        final String email = _emailController.text.trim();
        final String password = _passwordController.text.trim();

        final user = UserModel(
          userId: '',
          username: username,
          email: email,
        );
        await _authProvider.signUp(user, password).then((value) {
          Helper.snackBar(
            'Account created successfully',
            context,
          );
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
