import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route='/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('home');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
  }
}
