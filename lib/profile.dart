import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  io.File _image;

  _ProfilePageState() {
    _fetchLocalFile();
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future _fetchLocalFile() async {
    final path = await _localPath;
    final fullPath = '$path/profileImage.png';
    final exists = await io.File(fullPath).exists();
    if(exists){
      setState(() {
      _image = io.File(fullPath);
    });
    }
  }
  void _saveLocalFile(io.File file) async{
    final path = await _localPath;
    final fullPath = '$path/profileImage.png';
    var newFile = io.File(fullPath);
    newFile.writeAsBytesSync(file.readAsBytesSync());
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _saveLocalFile(image);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Profile"),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : new Container(
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: new FileImage(_image)))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: CustomBottomBar(index: 3),
    );
  }
}
