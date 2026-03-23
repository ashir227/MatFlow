import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:provider/provider.dart';

void showImagesource(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Column(
        children: [
          ListTile(
            // tileColor: Appcolor.Mat,
            title: Icon(Icons.camera, color: Appcolor.Flow, size: 35),
            onTap: () {
              context.read<ImagePckProvider>().pckfrmcamera();
              Navigator.pop(context);
            },
          ),
          ListTile(
            // tileColor: Appcolor.Mat,
            title: Icon(
              Icons.file_copy_outlined,
              color: Appcolor.Flow,
              size: 35,
            ),
            onTap: () {
              context.read<ImagePckProvider>().pckfrmglry();
            },
          ),
        ],
      );
    },
  );
}
