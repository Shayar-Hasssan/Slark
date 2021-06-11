import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slark/ui/landing.dart';
import 'package:slark/ui/login.dart';
import 'package:slark/ui/register.dart';
import 'package:slark/ui/splashScreen.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String route = '';
  // @override
  // void initState() async {
  //   await navRoute();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/register',
      routes: {
        '/splash': (ctx) => SplashScreen(),
        '/register': (ctx) => RegisterScreen(),
        '/login': (ctx) => LoginScreen(),
        '/landing': (ctx) => LandingUi(),
      },
      // home: SplashScreen(),
    );
  }

  // navRoute() {
  //   bool loggedIn = false;
  //   if (loggedIn) {
  //     Navigator.pushReplacementNamed(ctx, '/splash');
  //   } else {
  //     Navigator.pushReplacementNamed(ctx, '/home');
  //   }
  // }
}
