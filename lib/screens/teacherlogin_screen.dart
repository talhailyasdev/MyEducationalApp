import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/Teachersignup_Screen.dart';
import 'package:my_educational_app/screens/teacher_homescreen.dart';
import 'package:my_educational_app/screens/teacher_recoverpassword.dart';
import 'package:my_educational_app/screens/welcome_screen.dart';
import 'package:my_educational_app/utils/utilities.dart';
import 'package:my_educational_app/authorization/login_with_phone_number.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  var usernameText = TextEditingController();
  var passwordText = TextEditingController();
  bool obscurePassword = true;
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
              height: MediaQuery.of(context).size.height *
                  0.15, // 15% of screen height
              width: MediaQuery.of(context).size.width, // Full screen width
              decoration: BoxDecoration(
                color: MyColors.appBarColor,
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
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
                            return WelcomeScreen();
                          },
                        ));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Teacher Login",
                    style: myCustomTextStyle(),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCircleAvatar(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [LoginTextFields()],
                      ),
                      /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [LoginPageRoutes()],
                        )
                        */
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
}

class MyCircleAvatar extends StatefulWidget {
  const MyCircleAvatar({super.key});

  @override
  State<MyCircleAvatar> createState() => _MyCircleAvatarState();
}

class _MyCircleAvatarState extends State<MyCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 90,
      backgroundColor:
          Colors.transparent, // Set the background color to transparent
      child: ClipOval(
        child: Image.asset(
          "assets/logos/blacklogo.png",
          width: 250, // Set the desired width
          height: 250, // Set the desired height
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({Key? key}) : super(key: key);

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  final _formKey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  bool obscurePassword = true;
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailText.text.toString(),
            password: passwordText.text.toString())
        .then((value) {
      Utilities().toastMessage(value.user!.email.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => TeacherHomeScreen())));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utilities().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 350, // Set the desired width
                      child: TextFormField(
                        controller: emailText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 350, // Set the desired width
                      child: TextFormField(
                        obscureText: obscurePassword,
                        controller: passwordText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: Icon(obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 210, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return TeacherRecoverPassword();
                                },
                              ));
                            },
                            child: Text(
                              "Forget Password?",
                              style: myCustomTextStyle(
                                  mycolor: Colors.black,
                                  myFontSize: 16,
                                  myFontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          title: "Login",
                          loading: loading,
                          /*
                          child: Text(
                            "Login",
                            style: myCustomTextStyle(
                                mycolor: Colors.black, myFontSize: 20),
                          ),
                          style: getDynamicButtonStyle(210, 50),
                          */
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text("Don't have account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return TeacherSignupScreen();
                              })));
                            },
                            child: Text(
                              "Signup",
                              style: myCustomTextStyle(
                                  mycolor: Colors.blueAccent,
                                  myFontSize: 16,
                                  myFontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        LoginWithPhoneNumber())));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text("Login with phone"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
