import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/home_screen.dart';
import 'package:my_educational_app/screens/subjectsmenu_screen.dart';

// Model to represent the data for each grid item
class TeacherInfo {
  final String name;
  final String email;
  final String iconPath; // Icon path as a String
  final String photoPath; // Photo path as a String
  final Widget destinationPage;

  TeacherInfo({
    required this.name,
    required this.email,
    required this.iconPath,
    required this.photoPath,
    required this.destinationPage,
  });
}

class SubjectMaterial extends StatefulWidget {
  const SubjectMaterial({Key? key}) : super(key: key);

  @override
  State<SubjectMaterial> createState() => SubjectMaterialState();
}

class SubjectMaterialState extends State<SubjectMaterial> {
  // List of TeacherInfo objects representing each grid item's data
  final List<TeacherInfo> teacherInfos = [
    TeacherInfo(
      name: "Teacher 1",
      email: "teacher1@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage1(),
    ),
    TeacherInfo(
      name: "Teacher 2",
      email: "teacher2@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage2(),
    ),
    TeacherInfo(
      name: "Teacher 3",
      email: "teacher3@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage3(),
    ),
    TeacherInfo(
      name: "Teacher 4",
      email: "teacher4@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage4(),
    ),
    TeacherInfo(
      name: "Teacher 5",
      email: "teacher5@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage5(),
    ),
    TeacherInfo(
      name: "Teacher 6",
      email: "teacher6@example.com",
      iconPath: "assets/icons/Keybooksfolder.png",
      photoPath: "assets/images/anzish.jpg",
      destinationPage: DestinationPage6(),
    ),
  ];

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
                padding: const EdgeInsets.only(right: 90),
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
                              return SubjectsMenu();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "English",
                      style: myCustomTextStyle(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MyColors.bodyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //crossAxisSpacing: 6.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: teacherInfos.length,
                itemBuilder: (context, index) {
                  // Return a GridItem with TeacherInfo for each item
                  return GridItem(teacherInfo: teacherInfos[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeScreenBNB(),
    );
  }
}

class GridItem extends StatelessWidget {
  final TeacherInfo teacherInfo;

  GridItem({required this.teacherInfo});

  @override
  Widget build(BuildContext context) {
    final double courseCompletionPercentage = 0.65; // Example percentage

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => teacherInfo.destinationPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top: Icon (Optional, remove if not needed)
              Image.asset(
                teacherInfo.iconPath,
                width: 300, // Set the width to control the size
                height: 70, // Set the height to control the size
              ),
              SizedBox(height: 2), // Space after the icon (Optional)
              // Row for Teacher's photo and name
              Row(
                children: [
                  // Left side: Teacher's photo
                  CircleAvatar(
                    backgroundImage: AssetImage(teacherInfo.photoPath),
                    radius: 30, // Adjust the size as necessary
                  ),
                  SizedBox(width: 10), // Space between photo and name
                  // Right side: Teacher's name and email
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teacherInfo.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // Teacher's email
                        Text(
                          teacherInfo.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Course completion percentage bar and label
              Text("Course Progress: ${courseCompletionPercentage * 100}%"),
              SizedBox(height: 4),
              LinearProgressIndicator(
                value: courseCompletionPercentage,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                minHeight: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample destination pages (replace with your actual pages)
class DestinationPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 1")),
      body: Center(child: Text("Content of Destination Page 1")),
    );
  }
}

class DestinationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 2")),
      body: Center(child: Text("Content of Destination Page 2")),
    );
  }
}

class DestinationPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 3")),
      body: Center(child: Text("Content of Destination Page 3")),
    );
  }
}

class DestinationPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 4")),
      body: Center(child: Text("Content of Destination Page 4")),
    );
  }
}

class DestinationPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 5")),
      body: Center(child: Text("Content of Destination Page 5")),
    );
  }
}

class DestinationPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destination Page 6")),
      body: Center(child: Text("Content of Destination Page 6")),
    );
  }
}
