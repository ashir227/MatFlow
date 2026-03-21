import 'package:flutter/material.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:provider/provider.dart';

void showImagesource(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Column(
        children: [
          ListTile(
            title: Icon(Icons.camera),
            onTap: () {
              context.read<ImagePckProvider>().pckfrmcamera();
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Icon(Icons.file_copy_outlined),
            onTap: () {
              context.read<ImagePckProvider>().pckfrmglry();
            },
          ),
        ],
      );
    },
  );
}
