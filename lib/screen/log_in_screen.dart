import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chat/auth/provider/auth_provider.dart';
import 'package:quick_chat/main.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome to Quick Chat'),
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        width: mediaQuery.width * .5,
                        top: mediaQuery.height * .15,
                        right: isAnimate
                            ? mediaQuery.width * .25
                            : -mediaQuery.width * .5,
                        duration: Duration(seconds: 3),
                        child: Image.asset('assets/images/bubble-chat.png')),
                    Positioned(
                        left: mediaQuery.width * .43,
                        top: mediaQuery.height * .70,
                        child: GestureDetector(
                          onTap: () async {
                            await provider.googleLogIn();
                            if (provider.errorMsg == null) {
                              if(context.mounted){
                              Navigator.pushReplacementNamed(context, '/chat');
                            }}
                          },
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 50,
                            width: 50,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
// 'assets/images/google.png',
