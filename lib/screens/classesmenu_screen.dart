import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/home_screen.dart';
import 'package:my_educational_app/screens/subjectsmenu_screen.dart';

class ChoosingClassMenu extends StatefulWidget {
  const ChoosingClassMenu({super.key});

  @override
  State<ChoosingClassMenu> createState() => _ChoosingClassMenuState();
}

class _ChoosingClassMenuState extends State<ChoosingClassMenu> {
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
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
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
                              return HomeScreen();
                            },
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Choose Class",
                      style: myCustomTextStyle(),
                    )
                  ],
                ),
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
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Choose your class to read",
                        style: myCustomTextStyle(
                            mycolor: Colors.black, myFontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Add some spacing
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                4, // Keep this for your class buttons only
                            itemBuilder: (context, index) {
                              // Define a list of button names
                              List<String> buttonNames = [
                                "Class 9",
                                "Class 10",
                                "FSC Part-I",
                                "FSC Part-2",
                              ];

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 35, right: 35, top: 28),
                                child: Container(
                                  width:
                                      200, // Use the full width of the screen
                                  height: 70,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Navigate based on button index or label
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubjectsMenu()),
                                      );
                                    },
                                    icon: Icon(Icons
                                        .arrow_right_alt), // Icon for the button
                                    label: Text(buttonNames[
                                        index]), // Use the name from the list
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color(0xFF0F6727), // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 120,
                            right: 120,
                            bottom: 130,
                          ),
                          child: Container(
                            width: double
                                .infinity, // Use the full width of the screen
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Handle the Back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              icon:
                                  Icon(Icons.arrow_back), // Icon for the button
                              label: Text(
                                "Back",
                                style: myCustomTextStyle(
                                    myFontSize: 20,
                                    myFontWeight: FontWeight.w400,
                                    mycolor: Colors.black),
                              ), // Button label
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color(0xFFF5B40C), // Text color
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xE50F6727)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//cases for different pages navigation
/*
Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 28),
                          child: Container(
                            width: 200, // Use the full width of the screen
                            height: 70,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Navigate based on button index or label
                                switch (index) {
                                  case 0:
                                    // Navigate to Class 9 screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                    break;
                                  case 1:
                                    // Navigate to Class 10 screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                    break;
                                  case 2:
                                    // Navigate to FSC Part-I screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                    break;
                                  case 3:
                                    // Navigate to FSC Part-2 screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                    break;
                                }
                              },
*/