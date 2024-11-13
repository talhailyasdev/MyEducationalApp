import 'package:flutter/material.dart';

TextStyle myCustomTextStyle({
  dynamic myFontSize = 28,
  dynamic myFontWeight = FontWeight.bold,
  dynamic mycolor = Colors.white,
}) =>
    TextStyle(
      fontSize: myFontSize.toDouble(),
      fontWeight: myFontWeight,
      color: mycolor,
    );

class MyColors {
  static const Color appBarColor = Color(0xFF0F6728); // Green color
  static const Color bodyColor = Color(0xFFF5F5F5); // White color
  //static const Color textColor = Colors.black; // Black text color
}

ButtonStyle getDynamicButtonStyle(double width, double height) {
  return ElevatedButton.styleFrom(
    minimumSize: Size(width, height),
    backgroundColor: Color(0xFFF5B40C),
    elevation: 0.1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: Colors.black, // Set the border color
        width: 1.0, // Set the border width
      ),
    ),
  );
}

const List<Map<String, String>> studentHomescreenIcons = [
  {'name': 'keybooks', 'iconpath': 'assets/icons/keybooks.png'},
  {'name': 'Notes', 'iconpath': 'assets/icons/notes.png'},
  {'name': 'MCQS', 'iconpath': 'assets/icons/mcqs.png'},
  {'name': 'Quizes', 'iconpath': 'assets/icons/quizes.png'},
  {'name': 'Courses', 'iconpath': 'assets/icons/courses.png'},
];

const List<Map<String, String>> teacherHomescreenIcons = [
  {'name': 'Upload keybooks', 'iconpath': 'assets/icons/uploadkeybooks.png'},
  {'name': 'Upload Notes', 'iconpath': 'assets/icons/uploadnotes.png'},
  {'name': 'Upload MCQS', 'iconpath': 'assets/icons/uploadmcqs.png'},
  {'name': 'Upload Quizes', 'iconpath': 'assets/icons/uploadquizes.png'},
  {'name': 'Upload Courses', 'iconpath': 'assets/icons/uploadcourses.png'},
];

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color? color; // New parameter for button color

  const RoundButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.color, // Initialize the color parameter
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
            color: color ??
                Color(
                    0xFFF5B40C), // Use specified color if provided, else use default color
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
          )),
    );
  }
}
