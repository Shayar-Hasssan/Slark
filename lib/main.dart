import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slark/ui/InitialSplashScreen.dart';
import 'package:slark/ui/landing.dart';
import 'package:slark/ui/login.dart';
import 'package:slark/ui/register.dart';

import 'globals.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });
  GetuserId().then((value) {
    accToken = value;
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slark',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "AdventPro",
      ),
      initialRoute: '/register',
      routes: {
        //   '/splash': (ctx) => SplashScreen(),
        '/register': (ctx) => RegisterScreen(),
        '/login': (ctx) => LoginScreen(),
        '/landing': (ctx) =>
            accToken.isEmpty ? InitialSplashScreen(userId) : LandingUi(),
        //   '/home': (ctx) => HomeScreen(),
        //   '/space': (ctx) => SpaceScreen(),
        //   '/uTasks': (ctx) => UserTasksScreen(),
        //   '/listInfo': (ctx) => ListInfo(),
        //   '/taskInfo': (ctx) => TaskInfo(),
        //   '/board': (ctx) => Board(),
        //   '/setting': (ctx) => SettingScreen(),
        //   '/gantt': (ctx) => GanttChartScreen(),
        //   '/stepper': (ctx) => StepperScreen(data)
      },
    );
  }
}
