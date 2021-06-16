import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slark/ui/board.dart';
import 'package:slark/ui/ganttChart.dart';
import 'package:slark/ui/landing.dart';
import 'package:slark/ui/listInfo.dart';
import 'package:slark/ui/login.dart';

import 'package:slark/ui/register.dart';
import 'package:slark/ui/setting.dart';
import 'package:slark/ui/space.dart';
import 'package:slark/ui/splashScreen.dart';
import 'package:slark/ui/stepper.dart';
import 'package:slark/ui/taskInfo.dart';
import 'package:slark/ui/home.dart';
import 'package:slark/ui/user_tasks.dart';

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
        primarySwatch: Colors.indigo,
        fontFamily: "AdventPro",
      ),
      initialRoute: '/stepper',
      routes: {
        '/splash': (ctx) => SplashScreen(),
        '/register': (ctx) => RegisterScreen(),
        '/login': (ctx) => LoginScreen(),
        '/landing': (ctx) => LandingUi(),
        '/home': (ctx) => HomeScreen(),
        '/space': (ctx) => SpaceScreen(),
        '/uTasks': (ctx) => UserTasksScreen(),
        '/listInfo': (ctx) => ListInfo(),
        '/taskInfo': (ctx) => TaskInfo(),
        '/board': (ctx) => Board(),
        '/setting': (ctx) => SettingScreen(),
        '/gantt': (ctx) => GanttChartScreen(),
        '/stepper': (ctx) => StepperScreen()
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
