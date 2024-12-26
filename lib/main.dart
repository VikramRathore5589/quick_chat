import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chat/auth/provider/auth_provider.dart';
import 'package:quick_chat/auth/service/auth_service.dart';
import 'package:quick_chat/firebase_options.dart';
import 'package:quick_chat/firestote/provider/user_provider.dart';
import 'package:quick_chat/firestote/screen/chat_screen.dart';
import 'package:quick_chat/firestote/service/user_service.dart';
import 'package:quick_chat/screen/log_in_screen.dart';
import 'package:quick_chat/screen/splash_screen.dart';

late Size mediaQuery;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(AuthService()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserChatProvider(UserChatService()),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LogInScreen(),
            '/chat': (context) => ChatScreen(),
          }),
    );
  }
}
