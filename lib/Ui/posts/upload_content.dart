import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/Ui/posts/english_contents.dart';
import 'package:my_educational_app/screens/subjectsmenu_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:my_educational_app/screens/teacher_homescreen.dart';
import 'package:my_educational_app/utils/utilities.dart';

class UploadContent extends StatefulWidget {
  final String subjectName; // Add subjectName as a parameter
  const UploadContent({Key? key, required this.subjectName}) : super(key: key);

  @override
  State<UploadContent> createState() => _UploadContentState();
}

class _UploadContentState extends State<UploadContent> {
  File? _image;
  final picker = ImagePicker();
  bool loading = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');

  Future<void> getGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        // Check if the picked file has an image extension
        if (pickedFile.path.endsWith('.jpg') ||
            pickedFile.path.endsWith('.jpeg') ||
            pickedFile.path.endsWith('.png') ||
            pickedFile.path.endsWith('.gif')) {
          _image = File(pickedFile.path);
        } else {
          print("Selected file is not an image");
        }
      } else {
        print("No image picked");
      }
    });
  }

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SubjectsMenu())));
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload your content",
                          style: myCustomTextStyle(mycolor: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        getGalleryImage();
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: _image != null
                            ? Image.file(_image!.absolute)
                            : Center(child: Icon(Icons.image)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RoundButton(
                      title: "Upload",
                      loading: loading,
                      onTap: () async {
                        if (_image == null) {
                          Utilities().toastMessage('No image selected');
                          return;
                        }

                        setState(() {
                          loading = true;
                        });

                        String fileExtension = _image!.path.split('.').last;
                        firebase_storage.Reference ref =
                            firebase_storage.FirebaseStorage.instance.ref(
                                '/MyImages/${DateTime.now().millisecondsSinceEpoch}.$fileExtension');
                        firebase_storage.UploadTask uploadTask = ref.putFile(
                            _image!.absolute,
                            firebase_storage.SettableMetadata(
                                contentType: 'image/$fileExtension'));

                        try {
                          await uploadTask;
                          String newUrl = await ref.getDownloadURL();

                          String? newKey = databaseRef
                              .push()
                              .key; // Get a new key for the database entry
                          await databaseRef.child(newKey!).set({
                            'id': newKey,
                            'title': newUrl,
                            'type': fileExtension,
                            'format': fileExtension.toUpperCase(),
                            'subject': widget
                                .subjectName, // Associate image with subject
                          });

                          setState(() {
                            loading = false;
                          });

                          Utilities().toastMessage('Uploaded successfully');
                          // Navigate back to TeacherHomeScreen after upload
                          Navigator.pop(context); // Pop current screen
                          /*
                          // Navigate to StudentHomeScreen after upload
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentHomeScreen(),
                            ),
                          );
                          */
                        } catch (error) {
                          print(error.toString());
                          setState(() {
                            loading = false;
                          });
                          Utilities().toastMessage('Upload failed');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
