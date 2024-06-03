import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_application/onboarding1.dart';
import 'package:firebase_application/pages/home.dart';
import 'package:firebase_application/pages/liked_articles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';
import 'profile_page.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool hasCompletedOnboarding =
      prefs.getBool('hasCompletedOnboarding') ?? false;
  String? username = prefs.getString('username');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LikedArticles()),
    ],
    child: MyApp(
      hasCompletedOnboarding: hasCompletedOnboarding,
      username: username,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool hasCompletedOnboarding;
  final String? username;

  const MyApp({
    Key? key,
    required this.hasCompletedOnboarding,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FAT FOX',
      theme: ThemeData(
        primaryColor: Colors.orange,
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Colors.orange,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Start with splash screen
        '/onboarding': (context) =>
            OnboardingPage(), // Define your onboarding page here
        '/login': (context) => const LoginPage(), // Define your login page here
        '/home': (context) => const Home(), // Define your home page here
        '/profile': (context) =>
            const ProfilePage(), // Define your profile page here
      },
      onGenerateRoute: (settings) {
        if (username == null) {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        } else if (!hasCompletedOnboarding) {
          return MaterialPageRoute(builder: (context) => OnboardingPage());
        } else if (username != null) {
          return MaterialPageRoute(builder: (context) => const Home());
        } else {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
