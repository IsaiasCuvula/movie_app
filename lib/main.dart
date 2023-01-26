import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/providers/auth_provider.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/providers/watch_list_movie_provider.dart';
import 'package:movie_app/screens/auth_screen/welcome_screen.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/init_shared_prefs.dart';
import 'package:movie_app/utils/movie_app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initiateSharedPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = prefs.getBool(kIsLoggedIn) ?? false;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MovieProvider()),
        ChangeNotifierProvider(create: (ctx) => WatchListMovieProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: MovieAppTheme.dark(),
        home: isLoggedIn ? const HomeScreen() : const WelcomeScreen(),
      ),
    );
  }
}
