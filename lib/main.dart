import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slark/ui/login.dart';

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
      initialRoute: '/login',
      routes: {
        //   '/splash': (ctx) => SplashScreen(),
        //   '/register': (ctx) => RegisterScreen(),
        '/login': (ctx) => LoginScreen(),
        //   '/landing': (ctx) => LandingUi(),
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

  // navRoute() {
  //   bool loggedIn = false;
  //   if (loggedIn) {
  //     Navigator.pushReplacementNamed(ctx, '/splash');
  //   } else {
  //     Navigator.pushReplacementNamed(ctx, '/home');
  //   }
  // }
}
