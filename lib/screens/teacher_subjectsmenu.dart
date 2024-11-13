import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/Ui/posts/english_contents.dart';
import 'package:my_educational_app/Ui/posts/upload_content.dart';
import 'package:my_educational_app/screens/subjectsmaterial_screen.dart';
import 'package:my_educational_app/screens/teacher_classesmenu.dart';

class TeacherSubjectsMenu extends StatefulWidget {
  const TeacherSubjectsMenu({super.key});

  @override
  State<TeacherSubjectsMenu> createState() => _TeacherSubjectsMenuState();
}

class _TeacherSubjectsMenuState extends State<TeacherSubjectsMenu> {
  @override
  Widget build(BuildContext context) {
    // Create a list of subject names
    List<String> subjectNames = [
      "English",
      "Urdu",
      "Mathematics",
      "Physics",
      "Chemistry",
      "Biology",
      "Computer Science",
    ];

    //subjectNames.sort((a, b) => a.compareTo(b));

    // Create a map to associate each subject name with its icon path
    Map<String, String> subjectIcons = {
      "English": "assets/icons/english.png",
      "Urdu": "assets/icons/urdu.png",
      "Mathematics": "assets/icons/maths.png",
      "Physics": "assets/icons/physics.png",
      "Chemistry": "assets/icons/chemistry.png",
      "Biology": "assets/icons/biology.png",
      "Computer Science": "assets/icons/computer.png",
    };

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MyColors.appBarColor,
        ),
        child: Column(
          children: [
            // AppBar Container
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
                              return TeacherClassesMenu();
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
            // Subjects Container
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
                children: subjectNames
                    .map((subject) => subjectContainer(
                        subject, subjectIcons[subject]!, context))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget subjectContainer(
      String subjectName, String iconPath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToSubjectPage(subjectName, context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(4),
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
        child: Row(
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
                Text(
                  subjectName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5B40C),
                shape: BoxShape.circle,
              ),
              child: Text(
                "View ",
                style: TextStyle(color: Colors.black),
              ),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UploadContent(subjectName: "English")));
        break;
      case "Urdu":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SubjectMaterial()));
        break;
      case "Biology":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SubjectMaterial()));
        break;
      // Add cases for other subjects as needed
    }
    // Add cases for other subjects as needed
  }
}
