import 'package:flutter/material.dart';
import 'package:my_educational_app/Routes/routes_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:my_educational_app/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Aplication",
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: SplashScreen(),
      initialRoute: RoutesName.splashscreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
