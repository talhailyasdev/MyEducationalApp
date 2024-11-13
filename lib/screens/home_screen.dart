import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/Ui/posts/add_posts.dart';
import 'package:my_educational_app/screens/classesmenu_screen.dart';
import 'package:my_educational_app/screens/recent_screen.dart';
import 'package:my_educational_app/screens/settings_screen.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';
import 'package:my_educational_app/utils/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: Text(
          'Taleem-e-Hunar',
          style:
              myCustomTextStyle(myFontSize: 28, myFontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => StudentLoginScreen())));
              }).onError((error, stackTrace) {
                Utilities().toastMessage(error.toString());
              });
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_2_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to the settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsMenu()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.78,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.bodyColor,
                ),
                child: Column(
                  children: [
                    HomescreenImages(),
                    HomescreenRecent(),
                    HomeScreenIcons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeScreenBNB(),
    );
  }
}

class HomescreenImages extends StatelessWidget {
  const HomescreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Container(
                  width: 380,
                  height: 180,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bookimage3.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 380,
                  height: 180,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bookimage2.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HomescreenRecent extends StatelessWidget {
  const HomescreenRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 160,
          decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Recent",
                      style: myCustomTextStyle(
                          myFontSize: 24,
                          myFontWeight: FontWeight.bold,
                          mycolor: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RecentScreen())));
                    },
                    child: Text("See all"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HomeScreenIcons extends StatefulWidget {
  const HomeScreenIcons({super.key});

  @override
  State<HomeScreenIcons> createState() => _HomeScreenIconsState();
}

class _HomeScreenIconsState extends State<HomeScreenIcons> {
  int selectedIconIndex = -1; // Initialize with an invalid index
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: 280,
          width: 370,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 14.0,
            ),
            itemCount: studentHomescreenIcons.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => onIconTap(
                      context, studentHomescreenIcons[index]['name']!, index),
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: ShapeDecoration(
                      color: selectedIconIndex == index
                          ? Color(0xFFF5B40C) // Selected color
                          : Colors.white.withOpacity(
                              0.800000011920929), // Non-selected color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x660F6727),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          studentHomescreenIcons[index]['iconpath']!,
                          height: 110.0,
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ),
    ]);
  }

  void onIconTap(BuildContext context, String iconName, int index) {
    setState(() {
      selectedIconIndex = index; // Highlight the selected icon
    });

    // Simulate a delay to show the highlighted icon before navigating
    Future.delayed(Duration(milliseconds: 150), () {
      // Replace the below navigation logic with actual navigation based on iconName
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          switch (iconName) {
            case 'Keybooks':
              return const ChoosingClassMenu(); // Replace with actual page
            case 'Notes':
              return const ChoosingClassMenu(); // Replace with actual page
            case 'MCQS':
              return const ChoosingClassMenu(); // Replace with actual page
            case 'Quizes':
              return const ChoosingClassMenu(); // Replace with actual page
            case 'Courses':
              return const ChoosingClassMenu(); // Replace with actual page
            default:
              return const ChoosingClassMenu(); // Default case or error handler
          }
        }),
      ).then((_) {
        // This block executes when you come back to this screen
        if (mounted) {
          setState(() {
            selectedIconIndex = -1; // Reset the highlight
          });
        }
      });
    });
  }
}

class HomeScreenBNB extends StatefulWidget {
  const HomeScreenBNB({Key? key}) : super(key: key);

  @override
  State<HomeScreenBNB> createState() => _HomeScreenBNBState();
}

class _HomeScreenBNBState extends State<HomeScreenBNB> {
  int _selectedIndex = -1;

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _selectedIndex = -1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      decoration: const ShapeDecoration(
        color: Color(0xFF0F6727),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconButtonWithText(0, Icons.home, "Home"),
            iconButtonWithText(1, Icons.people, "Community"),
            iconButtonWithText(2, Icons.settings, "Settings"),
          ],
        ),
      ),
    );
  }

  Widget iconButtonWithText(int index, IconData icon, String text) {
    Color iconColor =
        _selectedIndex == index ? const Color(0xFFF5B40C) : Colors.white;

    return GestureDetector(
      onTap: () {
        _onIconPressed(index);
        // Navigate based on the index
        switch (index) {
          case 0:
            // Navigate to Home Page
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            break;
          case 1:
            // Navigate to People Page
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPostScreen(imageUrl: "")));
            break;
          case 2:
            // Navigate to Settings Page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsMenu()));
            break;
          default:
            // Handle undefined index if necessary
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 40,
            color: iconColor,
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 80,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
