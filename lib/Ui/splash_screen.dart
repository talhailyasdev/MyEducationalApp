import 'package:flutter/material.dart';
import 'package:my_educational_app/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use Stack to position the logo in the center
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5CC163),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Center(
            // Center the logo
            child: Image.asset(
              "assets/logos/blacklogo.png",
              width: 350, // Set the width of your logo
              height: 350, // Set the height of your logo
            ),
          ),
        ],
      ),
    );
  }
}
