import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/edit_image_controller.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:provider/provider.dart';

class EditImageScreen extends StatefulWidget {
  static const String id = 'edit_image_screen';
  const EditImageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  EditImageController? controller;
  DetailsScreenController? detailsScreenController;
  @override
  void didChangeDependencies() {
    detailsScreenController =
        Provider.of<DetailsScreenController>(context, listen: false);
    controller = Provider.of<EditImageController>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            padding: const EdgeInsets.symmetric(
                                vertical: kSmallHeight,
                                horizontal: kMediumtHeight),
                            child: Column(
                              children: [
                                // TextFormField(
                                //   initialValue: controller!
                                //           .imageDescriptionText.isNotEmpty
                                //       ? controller!.imageDescriptionText
                                //       : '',
                                //   onChanged: (value) {
                                //     controller!.setImageDescriptionText(value);
                                //   },
                                //   maxLines: null,
                                //   keyboardType: TextInputType.multiline,
                                //   decoration: const InputDecoration(
                                //     labelText: 'Descrição',
                                //   ),
                                // ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Salvar'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Excluir'),
                          content: const Text(
                              'Tem certeza que deseja excluir a imagem?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Excluir'),
                              onPressed: () {
                                int popTimes = 0;
                                detailsScreenController!.deleteSelectedImage();
                                Navigator.popUntil(context, (route) {
                                  return popTimes++ == 2;
                                });
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete)),
          ],
        )
      ],
      appBar: AppBar(
        title: const Text('Editar Imagem'),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: Image.file(
                  detailsScreenController!.selectedImages[
                      detailsScreenController!.selectedImageIndex],
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              // child: Text(controller!.imageDescriptionText.isNotEmpty
              //     ? controller!.imageDescriptionText
              //     : controller!.defaultEditingText),
            ),
          ),
        ],
      ),
    );
  }
}
