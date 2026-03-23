import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImagePckProvider extends ChangeNotifier {
  final ImagePicker picked = ImagePicker();
  File? _image;
  File? get image => _image;
  final box = Hive.box("loginbox");
  Future<void> pckfrmglry() async {
    final XFile? Picked = await picked.pickImage(source: ImageSource.gallery);
    if (Picked != null) {
      _image = File(Picked.path);
      box.put("savedimg", Picked.path);
      notifyListeners();
    }
  }

  Future<void> pckfrmcamera() async {
    final XFile? Picked = await picked.pickImage(source: ImageSource.camera);
    if (Picked != null) {
      _image = File(Picked.path);
      box.put("savedimg", Picked.path);
      notifyListeners();
    }
    void Clearimage() {
      _image = null;
      notifyListeners();
    }
  }

  void loadimage() {
    final path = box.get("savedimg");
    if (path != null) {
      _image = File(path);
      notifyListeners();
    }
  }
}
