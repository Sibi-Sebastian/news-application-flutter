import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout {
  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context)
        .pushReplacementNamed('/login'); // Navigate to login page
  }
}
