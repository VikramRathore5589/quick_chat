import 'package:flutter/material.dart';
import 'package:quick_chat/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,'/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/bubble-chat.png',
              height: mediaQuery.height / 2,
              width: mediaQuery.width * .8,
            ),
          ),
          Text(
            'Made With Flutter',
            style: TextStyle(fontSize: 20, color: Colors.purpleAccent[400]),
          ),
          Image.asset(
            'assets/images/bubble-chat.png',
            height: 45,
            width: 45,
          ),
        ],
      ),
    );
  }
}
