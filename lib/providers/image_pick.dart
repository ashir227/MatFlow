import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageProviderClass extends ChangeNotifier {
  final ImagePicker picked = ImagePicker();
  File? _image;
  File? get image => _image;
  Future<void> pckfrmglry() async {
    final XFile? Picked = await picked.pickImage(source: ImageSource.gallery);
    if (Picked != null) {
      _image = File(Picked.path);
      notifyListeners();
    }
  }

  Future<void> pckfrmcamera() async {
    final XFile? Picked = await picked.pickImage(source: ImageSource.camera);
    if (Picked != null) {
      _image = File(Picked.path);
      notifyListeners();
    }
    void Clearimage() {
      _image = null;
      notifyListeners();
    }
  }
}
