import 'package:flutter/material.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/providers/auth_provider.dart';
import 'package:movie_app/screens/auth_screen/welcome_screen.dart';
import 'package:movie_app/screens/profile_screen/edit_profile_screen.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/helpers.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthProvider _authProvider;
  UserModel _user = UserModel(
    userId: '',
    username: 'Bernardo',
    email: '',
  );

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              const String title =
                  'Are you sure you want to sign out from the app?';
              await Helper.alertDialog(
                context: context,
                title: title,
                content: '',
                onTap: () {
                  _signOut(context);
                },
              );
            },
            icon: const Icon(Icons.exit_to_app_sharp),
          )
        ],
      ),
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: SingleChildScrollView(
          padding: kPadding20,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Consumer<AuthProvider>(
            builder: (ctx, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: _authProvider.fetchCurrentUserInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _user = snapshot.data as UserModel;

                        return Text(
                          _user.username,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  kVerticalSpace60,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        Helper.customTransition(
                          EditProfileScreen(
                            user: _user,
                          ),
                        ),
                      );
                    },
                    child: const Text('Edit Profile'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    _authProvider.signOut().then((value) {
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
