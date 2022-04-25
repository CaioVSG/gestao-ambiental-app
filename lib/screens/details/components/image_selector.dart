import 'package:flutter/material.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/edit%20image/edit_image_screen.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final DetailsScreenController? controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        controller!.editImage(index);
        Navigator.pushNamed(context, EditImageScreen.id);
      },
      // child: Text(
      //     controller!.selectedImages[index].path)
      child: Container(
        color: Colors.red,
        height: size.height * 0.3,
        width: size.width * 0.3,
        child: Stack(
          children: [
            Image.file(
              controller!.selectedImages[index],
              fit: BoxFit.cover,
              height: size.height * 0.3,
              width: size.width * 0.3,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text('Editar imagem',
                      style: TextStyle(backgroundColor: Colors.white)),
                  Icon(Icons.edit)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
