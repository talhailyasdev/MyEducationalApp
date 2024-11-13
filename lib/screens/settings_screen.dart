import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/home_screen.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  final List<MenuItem> menuItems = [
    MenuItem(
      leadingIcon: Icons.edit,
      name: 'Edit Profile',
      trailingIcon: Icons.arrow_forward_ios,
      screen: Screen1(),
    ),
    MenuItem(
      leadingIcon: Icons.person_outline,
      name: 'Invite Friends',
      trailingIcon: Icons.arrow_forward_ios,
      screen: Screen2(),
    ),
    MenuItem(
      leadingIcon: Icons.notifications,
      name: 'Notifications',
      trailingIcon: Icons.arrow_forward_ios,
      screen: Screen3(),
    ),
    MenuItem(
      leadingIcon: Icons.logout,
      name: 'Logout',
      trailingIcon: Icons.arrow_forward_ios,
      screen: Screen3(),
    ),
  ];

  bool contactSelected = false;
  bool aboutSelected = false;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 34,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text(
                      "Settings",
                      style: myCustomTextStyle(),
                    ),
                  ),
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
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/anzish.jpg",
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "john@example.com",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundButton(
                          title: "Contact Us",
                          onTap: () {
                            setState(() {
                              contactSelected = true;
                              aboutSelected = false;
                            });
                          },
                          color: contactSelected
                              ? Colors.green
                              : Color(0xFFF5B40C),
                        ),
                        RoundButton(
                          title: "About Us",
                          onTap: () {
                            setState(() {
                              aboutSelected = true;
                              contactSelected = false;
                            });
                          },
                          color:
                              aboutSelected ? Colors.green : Color(0xFFF5B40C),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item.screen,
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              item.leadingIcon,
                              color: Color(0xFF0F6728),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              item.trailingIcon,
                              color: Color(0xFF0F6728),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFFF5B40C),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData leadingIcon;
  final String name;
  final IconData trailingIcon;
  final Widget screen;

  MenuItem({
    required this.leadingIcon,
    required this.name,
    required this.trailingIcon,
    required this.screen,
  });
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Text('This is Screen 1'),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Text('This is Screen 2'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Center(
        child: Text('This is Screen 3'),
      ),
    );
  }
}
