//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  //File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        //_selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Maker'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _selectedImage != null
            //     ? Image.file(_selectedImage!, height: 250)
            //     : Center(child: Text('Upload photo')),
            SizedBox(height: 330),
            // ElevatedButton.icon(
            //   icon: Icon(Icons.photo),
            //   label: Text('Gallery'),
            //   onPressed: () => _pickImage(ImageSource.gallery),
            // ),
            // SizedBox(height: 10),
            // ElevatedButton.icon(
            //   icon: Icon(Icons.camera_alt),
            //   label: Text('Camera'),
            //   onPressed: () => _pickImage(ImageSource.camera),
            // ),
            ElevatedButton(onPressed: () => _pickImage(ImageSource.gallery), 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 185, 117, 165),
              minimumSize: Size(300, 60)
            ),
            child: 
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo),
                Text('Gallery'),
              ],
            ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () => _pickImage(ImageSource.camera), 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 185, 117, 165),
              minimumSize: Size(300, 60)
            ),
            child: 
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt),
                Text('Camera'),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}