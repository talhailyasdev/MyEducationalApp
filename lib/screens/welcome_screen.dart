import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_educational_app/Configuration/configuration.dart';

import 'package:my_educational_app/screens/studentlogin_screen.dart';

import 'package:my_educational_app/screens/teacherlogin_screen.dart';
//import 'package:my_educational_app/Routes/routes_names.dart';
//import 'package:my_educational_app/screens/registration_screen.dart';
//import 'package:my_educational_app/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator
            .pop(); // This line directly requests the system to close the app
        return false; // Prevents the route from popping automatically
      },
      child: Scaffold(
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
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Exit'),
                              content:
                                  Text('Do you really want to exit the app?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                    SystemNavigator.pop(); // Exit the app
                                  },
                                  child: Text('Exit'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Choose Option",
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
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome!",
                          style: myCustomTextStyle(mycolor: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "A Book is a dream ,that",
                          style: myCustomTextStyle(
                              mycolor: Colors.black,
                              myFontSize: 24,
                              myFontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "you hold in your hands",
                          style: myCustomTextStyle(
                              mycolor: Colors.black,
                              myFontSize: 24,
                              myFontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    MyRadioButtons(),
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

class MyRadioButtons extends StatefulWidget {
  const MyRadioButtons({super.key});

  @override
  State<MyRadioButtons> createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  String userType = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: userType == 'Student'
                    ? Color(0xFFF5B40C)
                    : MyColors.bodyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/student.png",
                      height: MediaQuery.of(context).size.width *
                          0.6, // Increase the size
                      width: MediaQuery.of(context).size.width *
                          0.45, // Increase the size
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Student',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value.toString();
                            });
                          },
                        ),
                        Text("Student")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: userType == 'Teacher'
                    ? Color(0xFFF5B40C)
                    : MyColors.bodyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/teacher.png",
                      height: MediaQuery.of(context).size.width *
                          0.6, // Increase the size
                      width: MediaQuery.of(context).size.width *
                          0.45, // Increase the size
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Teacher',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value.toString();
                            });
                          },
                        ),
                        Text("Teacher"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Check if userType is not set
              //The type of validation implemented in this scenario is often referred to as
              // "presence validation" or "required field validation."
              //It checks whether a specific field or input has a value (is not empty)
              // before allowing the user to proceed with a particular action,
              // in this case, navigating to the next screen.
              if (userType.isEmpty) {
                // Show a dialog with an error message
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("Please select an option above."),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Proceed with navigation since userType is set
                if (userType == 'Student') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentLoginScreen()),
                  );
                } else if (userType == 'Teacher') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherLoginScreen()),
                  );
                }
              }
            },
            child: Text(
              'Get Started',
              style: myCustomTextStyle(
                  mycolor: Colors.white,
                  myFontSize: 18,
                  myFontWeight: FontWeight.w500),
            ),
            style: getDynamicButtonStyle(210, 50),
          ),
        ],
      ),
    );
  }
}
