import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
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
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
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
                      padding: const EdgeInsets.only(right: 70),
                      child: Text(
                        "Update Password",
                        style: myCustomTextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.bodyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Now Confirm ",
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
                              width: 360,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/updatePassword.png"),
                                      fit: BoxFit.cover)),
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
                              "We sent you Email where you  ",
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
                              "can update your password  ",
                              style: myCustomTextStyle(
                                  mycolor: Colors.black,
                                  myFontSize: 20,
                                  myFontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return StudentLoginScreen();
                                  })));
                                },
                                child: Text(
                                  'Back to Login',
                                  style: myCustomTextStyle(
                                      mycolor: Colors.black,
                                      myFontSize: 18,
                                      myFontWeight: FontWeight.w500),
                                ),
                                style: getDynamicButtonStyle(210, 50)),
                          ],
                        )
                      ],
                    ),
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
/*
class UpdatePasswordTextFields extends StatefulWidget {
  const UpdatePasswordTextFields({super.key});

  @override
  State<UpdatePasswordTextFields> createState() => _UpdatePasswordTextFields();
}

class _UpdatePasswordTextFields extends State<UpdatePasswordTextFields> {
  var password = TextEditingController();
  var rePassword = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350, // Set the desired width
                child: TextField(
                  obscureText: obscurePassword,
                  obscuringCharacter: "*",
                  controller: password,
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
                      borderSide: BorderSide(color: MyColors.appBarColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350, // Set the desired width
                child: TextField(
                  obscureText: obscurePassword,
                  obscuringCharacter: "*",
                  controller: rePassword,
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
                      borderSide: BorderSide(color: MyColors.appBarColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Repeat Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
