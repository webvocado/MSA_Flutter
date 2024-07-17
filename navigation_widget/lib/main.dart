import 'package:flutter/material.dart';
import 'package:navigation_widget/models/user.dart';
import 'package:navigation_widget/screens/community/community_screen.dart';
import 'package:navigation_widget/screens/first_screen.dart';
import 'package:navigation_widget/screens/home_screen.dart';
import 'package:navigation_widget/screens/main_screen.dart';
import 'package:navigation_widget/screens/user/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: '/main',
      // routes: {
      //   '/main' : (context) => const MainScreen(),
      //   '/home' : (context) => const HomeScreen(),
      //   '/user' : (context) => UserScreen(user: User(id: '', name: ''),),
      //   '/community' : (context) => const CommunityScreen(),
      // },
      home: const FirstScreen(),
    );
  }
}