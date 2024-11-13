import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';
import 'package:my_educational_app/screens/updatepassword_screen.dart';
import 'package:my_educational_app/utils/utilities.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.appBarColor,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height *
                    0.15, // 15% of screen height
                width: MediaQuery.of(context).size.width, // Full screen width
                decoration: BoxDecoration(
                  color: MyColors.appBarColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 34,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigate back to the previous screen
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return StudentLoginScreen();
                            },
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Recover Password",
                        style: myCustomTextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height *
                    0.85, // 85% of screen height
                width: MediaQuery.of(context).size.width, // Full screen width
                decoration: BoxDecoration(
                  color: MyColors.bodyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Worry!",
                          style: myCustomTextStyle(mycolor: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 160,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/recoverpassword.png"),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter the email address ",
                          style: myCustomTextStyle(
                              mycolor: Colors.black,
                              myFontSize: 20,
                              myFontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "associated with your account",
                          style: myCustomTextStyle(
                              mycolor: Colors.black,
                              myFontSize: 20,
                              myFontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "we will email you a code to ",
                          style: myCustomTextStyle(
                              mycolor: Colors.black38,
                              myFontSize: 18,
                              myFontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "reset your password",
                          style: myCustomTextStyle(
                              mycolor: Colors.black38,
                              myFontSize: 18,
                              myFontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RecoverPasswordTextFields()],
                    ),

                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return CodeVerification();
                              })));
                            },
                            child: Text(
                              'Send Code',
                              style: myCustomTextStyle(
                                  mycolor: Colors.black,
                                  myFontSize: 18,
                                  myFontWeight: FontWeight.w500),
                            ),
                            style: getDynamicButtonStyle(210, 50)),
                      ],
                    )
                    */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecoverPasswordTextFields extends StatefulWidget {
  const RecoverPasswordTextFields({super.key});

  @override
  State<RecoverPasswordTextFields> createState() =>
      _RecoverPasswordTextFields();
}

class _RecoverPasswordTextFields extends State<RecoverPasswordTextFields> {
  var emailController = TextEditingController();
  var phoneNumber = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350, // Set the desired width
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.appBarColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              "or",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350, // Set the desired width
                child: TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.appBarColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                onTap: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .then((value) {
                    Utilities().toastMessage(
                        "We have sent you email to recover pasword, please check email");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => UpdatePasswordScreen())));
                  }).onError((error, stackTrace) {
                    Utilities().toastMessage(error.toString());
                  });
                },
                title: "Submit",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
