import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../database/database_helper.dart';
import 'change_language_screen.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final ImagePicker _imagePicker = ImagePicker();
  List<Map<String, dynamic>> images = [];

  get storage => null;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  void _loadImages() async {
    final imageList = await dbHelper.getImages();
    setState(() {
      images = imageList;
    });
  }

  Future<void> _pickImage() async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final int id = await dbHelper.insertImage("Untitled", "", image.path);
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangeLanguageScreen()),
                );
              },
              icon: Icon(
                Icons.language,
              )),
          IconButton(
            onPressed: () {
              storage.clear();
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Text("Assignment",
          style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final imagePath = images[index]['path'];
          final title = images[index]['title'];
          final description = images[index]['description'];

          return ListTile(
            leading: Image.file(File(imagePath)),
            title: Text(title),
            subtitle: Text(description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await dbHelper.deleteImage(images[index]['id']);
                _loadImages();
              },
            ),
            onTap: () {
              _editImage(images[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add),
      ),
    );
  }

  void _editImage(Map<String, dynamic> image) {
    TextEditingController titleController =
    TextEditingController(text: image['title']);
    TextEditingController descriptionController =
    TextEditingController(text: image['description']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                final int id = image['id'];
                final String newTitle = titleController.text;
                final String newDescription = descriptionController.text;
                await dbHelper.updateImage(
                    id, newTitle, newDescription, image['path']);
                _loadImages();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
