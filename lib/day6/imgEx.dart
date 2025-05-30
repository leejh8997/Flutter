import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(ImgApp());

class ImgApp extends StatelessWidget {
  const ImgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImgEx(),
    );
  }
}

class ImgEx extends StatefulWidget {
  const ImgEx({super.key});

  @override
  State<ImgEx> createState() => _ImgExState();
}

class _ImgExState extends State<ImgEx> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImg() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // 이미지 선택 시 _image 변수에 저장
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> getCameraImg() async{
  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
  setState(() {
  // 이미지 선택 시 _image 변수에 저장
  _image = File(pickedFile.path);
  });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이미지 선택"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
            ? Text("선택된 이미지 없음")
            : Image.file(_image!, width: 200, height: 200, fit: BoxFit.cover,),
            ElevatedButton(
                onPressed: getImg,
                child: Text("이미지 선택")
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: getCameraImg,
                child: Text("이미지 선택")
            )
          ],
        ),
      ),
    );
  }
}
