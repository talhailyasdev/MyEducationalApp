import 'package:flutter/material.dart';
import 'package:my_educational_app/screens/subjectsmaterial_screen.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/classesmenu_screen.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
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
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 34,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChoosingClassMenu();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Keybooks",
                      style: myCustomTextStyle(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MyColors.bodyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                children: [
                  subjectContainer(
                      "English", "assets/icons/english.png", context),
                  subjectContainer("Urdu", "assets/icons/urdu.png", context),
                  subjectContainer(
                      "Mathematics", "assets/icons/maths.png", context),
                  subjectContainer(
                      "Physics", "assets/icons/physics.png", context),
                  subjectContainer(
                      "Chemistry", "assets/icons/chemistry.png", context),
                  subjectContainer(
                      "Biology", "assets/icons/biology.png", context),
                  subjectContainer(
                      "Computer Science", "assets/icons/computer.png", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget subjectContainer(
      String subjectName, String iconPath, BuildContext context) {
    double courseCompletionPercentage =
        0.65; // Replace with the actual completion percentage

    return GestureDetector(
      onTap: () {
        navigateToSubjectPage(subjectName, context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      iconPath,
                      width: 85,
                      height: 85,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjectName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${subjectName} Keybooks", // Additional text below subject name
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                // View circle
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5B40C),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "View",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            // Progress bar
            LinearProgressIndicator(
              value: courseCompletionPercentage,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 5,
            ),

            // Progress in percentage
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(courseCompletionPercentage * 100).toInt()}% Completed",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 2),
            // Additional text or information if needed
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSubjectPage(String subjectName, BuildContext context) {
    // Handle navigation based on the subject name
    switch (subjectName) {
      case "English":
        // Navigate to English subject page
        // Replace the following line with your desired navigation logic
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SubjectMaterial()));
        break;
      case "Urdu":
        // Navigate to Urdu subject page
        // Replace the following line with your desired navigation logic
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SubjectMaterial()));
        break;
      // Add cases for other subjects as needed
    }
  }
}
