import 'package:flutter/material.dart';
import 'package:matflow/providers/image_pick.dart';
import 'package:provider/provider.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Provider.of<ImagePckProvider>(
              context,
              listen: false,
            ).pckfrmcamera();
          },
          icon: Icon(Icons.camera_alt),
        ),
        IconButton(
          onPressed: () {
            Provider.of<ImagePckProvider>(context, listen: false).pckfrmglry();
          },
          icon: Icon(Icons.file_copy_outlined),
        ),
      ],
    );
  }
}
