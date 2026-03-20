import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageProviderClass extends ChangeNotifier {
  final ImagePicker picked = ImagePicker();
  File? _image;
  File? get image => _image;

  Future<void> pckfrmglry() async {
    final XFile? Pickedimg = await picked.pickImage(
      source: ImageSource.gallery,
    );

    if (Pickedimg != null) {
      _image = File(Pickedimg.path);
      notifyListeners();
    }
  }
}
