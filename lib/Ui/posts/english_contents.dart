import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_educational_app/Configuration/configuration.dart';

class EnglishContent extends StatefulWidget {
  const EnglishContent({super.key});

  @override
  State<EnglishContent> createState() => _EnglishContentState();
}

class _EnglishContentState extends State<EnglishContent> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');
  List<String> imageUrls = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    setState(() {
      loading = true;
    });

    try {
      final dataSnapshot = await databaseRef.once();
      if (dataSnapshot.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            dataSnapshot.snapshot.value as Map<dynamic, dynamic>;
        List<String> urls = [];
        values.forEach((key, value) {
          if (value != null && value['title'] != null) {
            urls.add(value['title']);
          }
        });
        setState(() {
          imageUrls = urls;
          loading = false;
        });
      } else {
        setState(() {
          imageUrls = [];
          loading = false;
        });
      }
    } catch (error) {
      print('Error fetching image URLs: $error');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home Screen'),
        backgroundColor: MyColors.appBarColor,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrls[index],
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image));
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );
              },
            ),
    );
  }
}
