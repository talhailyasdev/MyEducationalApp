import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/utils/utilities.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key, required String imageUrl});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  //create refrence like table if we change it it create new table
  final databaseRef = FirebaseDatabase.instance.ref("post");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 6,
              controller: postController,
              decoration: InputDecoration(
                  hintText: "Whats in your mind", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: "Add",
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  databaseRef

                      //for making uniquness
                      .child(DateTime.now().microsecondsSinceEpoch.toString())
                      //comments is sub child
                      .child("comments")
                      .set({
                    "title": postController.text.toString(),
                    "id": DateTime.now().microsecondsSinceEpoch.toString()
                  }).then((value) {
                    Utilities().toastMessage("Post added");
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utilities().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}
