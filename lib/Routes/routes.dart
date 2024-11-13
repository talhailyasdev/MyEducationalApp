import 'package:flutter/material.dart';
import 'package:my_educational_app/Ui/splash_screen.dart';
import 'package:my_educational_app/screens/Studentsignup_screen.dart';
import 'package:my_educational_app/screens/Teachersignup_Screen.dart';
import 'package:my_educational_app/screens/classesmenu_screen.dart';
import 'package:my_educational_app/screens/home_screen.dart';
import 'package:my_educational_app/screens/student_recoverPassword.dart';
import 'package:my_educational_app/screens/settings_screen.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';
import 'package:my_educational_app/screens/subjectsmenu_screen.dart';
import 'package:my_educational_app/screens/teacher_classesmenu.dart';
import 'package:my_educational_app/screens/teacher_homescreen.dart';
import 'package:my_educational_app/screens/teacher_recoverpassword.dart';
import 'package:my_educational_app/screens/teacher_subjectsmenu.dart';
import 'package:my_educational_app/screens/teacherlogin_screen.dart';
import 'package:my_educational_app/screens/updatepassword_screen.dart';
import 'package:my_educational_app/screens/verification_screen.dart';

import 'package:my_educational_app/screens/welcome_screen.dart';

import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.welcome:
        return MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen());

      case RoutesName.studentLogin:
        return MaterialPageRoute(
            builder: (BuildContext context) => StudentLoginScreen());
      case RoutesName.teacherLogin:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherLoginScreen());
      case RoutesName.studentRegistration:
        return MaterialPageRoute(
            builder: (BuildContext context) => StudentSignupScreen());
      case RoutesName.teachertRegistration:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherSignupScreen());
      case RoutesName.studentrecoverPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => RecoverPasswordScreen());
      case RoutesName.teacherecoverPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherRecoverPassword());
      case RoutesName.passwordVerification:
        return MaterialPageRoute(
            builder: (BuildContext context) => CodeVerification());
      case RoutesName.updatePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpdatePasswordScreen());
      case RoutesName.studenthomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.teacherhomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherHomeScreen());
      case RoutesName.studentclassesmenu:
        return MaterialPageRoute(
            builder: (BuildContext context) => ChoosingClassMenu());
      case RoutesName.teacherclassesmenu:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherClassesMenu());
      case RoutesName.studentsubjectsmenu:
        return MaterialPageRoute(
            builder: (BuildContext context) => SubjectsMenu());
      case RoutesName.teachersubjetcsmenu:
        return MaterialPageRoute(
            builder: (BuildContext context) => TeacherSubjectsMenu());

      case RoutesName.settingsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SettingsMenu());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
