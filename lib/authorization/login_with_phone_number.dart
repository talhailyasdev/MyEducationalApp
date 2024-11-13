import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/authorization/verify_code.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';
import 'package:my_educational_app/utils/utilities.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MyColors.appBarColor,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MyColors.appBarColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 34,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentLoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Login with Phone",
                    style: myCustomTextStyle(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.bodyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Enter Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Phone Number";
                          }
                          // You can add more validation here if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: loading ? null : _loginWithPhoneNumber,
                        child: Text("Login"),
                      ),
                      if (loading) SizedBox(height: 20),
                      if (loading) CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginWithPhoneNumber() async {
    // Validate phone number format
    if (phoneNumberController.text.isEmpty) {
      Utilities().toastMessage("Please enter a phone number.");
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (_) {
          setState(() {
            loading = false;
          });
        },
        verificationFailed: (e) {
          setState(() {
            loading = false;
          });
          Utilities().toastMessage("Verification failed: $e");
        },
        codeSent: (String verificationId, int? token) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyCodeScreen(
                verificationId: verificationId,
              ),
            ),
          );
          setState(() {
            loading = false;
          });
        },
        codeAutoRetrievalTimeout: (e) {
          Utilities().toastMessage("Auto retrieval timeout: $e");
          setState(() {
            loading = false;
          });
        },
      );
    } catch (e) {
      setState(() {
        loading = false;
      });
      Utilities().toastMessage("An error occurred: $e");
    }
  }
}
