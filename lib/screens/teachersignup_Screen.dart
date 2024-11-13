import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/teacherlogin_screen.dart';
import 'package:my_educational_app/utils/utilities.dart';

class TeacherSignupScreen extends StatefulWidget {
  const TeacherSignupScreen({super.key});

  @override
  State<TeacherSignupScreen> createState() => _TeacherSignupScreenState();
}

class _TeacherSignupScreenState extends State<TeacherSignupScreen> {
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
                              return TeacherLoginScreen();
                            },
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Teacher Sign Up",
                      style: myCustomTextStyle(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignupTextFields(),
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

class SignupTextFields extends StatefulWidget {
  const SignupTextFields({super.key});

  @override
  State<SignupTextFields> createState() => _SignupTextFieldsState();
}

class _SignupTextFieldsState extends State<SignupTextFields> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  //final repeatpasswordText = TextEditingController();
  bool obscurePassword = true;

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  void signUp() {
    setState(() {
      loading = true;
    });
    auth
        .createUserWithEmailAndPassword(
            email: emailText.text.toString(),
            password: passwordText.text.toString())
        .then((value) {
      // Utilities().toastMessage(value.user!.email.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => TeacherLoginScreen())));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
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
                    /*
                    SizedBox(height: 20),
                    Container(
                      width: 350, // Set the desired width
                      child: TextFormField(
                        obscureText: obscurePassword,
                        controller: repeatpasswordText,
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
                          labelText: 'Re-Password',
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
                    */
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(
                          title: "Signup",
                          loading: loading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              signUp();
                            }
                          },

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
