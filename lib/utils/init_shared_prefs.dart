import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future<void> initiateSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}
