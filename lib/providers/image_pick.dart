import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImagePckProvider extends ChangeNotifier {
  final ImagePicker picked = ImagePicker();
  File? _image;
  File? get image => _image;
  Future<void> pckfrmglry() async {
    final XFile? Picked = await picked.pickImage(source: ImageSource.gallery);
    if (Picked != null) {
      _image = File(Picked.path);
      notifyListeners();
    }
    if (_image != null) {
      var box = Hive.box("pckimg");
      box.put(, true);

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
