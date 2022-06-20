import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/core/util/custom_date_formater.dart';
import 'package:meioambientemobile/screens/details/components/docs_dialog.dart';
import 'package:meioambientemobile/screens/details/components/finish_details_dialog.dart';
import 'package:meioambientemobile/screens/details/components/image_selector.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String id = 'details_screen';
  const DetailsScreen(
      {Key? key,
      required this.denunciaId,
      required this.type,
      this.text,
      required this.eventDate,
      this.completedDate,
      required this.creationDate,
      required this.adress,
      required this.street,
      required this.adressNumber,
      required this.district,
      required this.city,
      required this.cep,
      required this.complement,
      required this.phoneNumber,
      required this.cnpj,
      required this.companyId,
      required this.companyName,
      required this.email,
      required this.name,
      required this.profilePhotoUrl,
      this.requirementId,
      this.denunciante,
      required this.visitId})
      : super(key: key);
  final int denunciaId;
  final int visitId;
  final String type;
  final String? text;
  final String eventDate;
  final String? completedDate;
  final String creationDate;
  final String adress;

  final String street;
  final String adressNumber;
  final String district;
  final String city;
  final String complement;
  final String cep;

  final String cnpj;
  final int companyId;
  final String companyName;
  final String phoneNumber;
  final String email;
  final String name;
  final String profilePhotoUrl;

  final String? denunciante;
  final int? requirementId;

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  late final Future _getVisitImages;
  late final Future _getVisitDoneImages;
  late String _token;
  late DetailsScreenController? controller;
  @override
  void initState() {
    _getVisitImages = Api().getAllImagesFromVisits(
        denunciaId: widget.denunciaId, context: context);
    if (widget.completedDate != null) {
      _getVisitDoneImages = Api().getVisitDoneImages(
          visitId: widget.denunciaId != 0 ? widget.denunciaId : widget.visitId,
          context: context);
    }

    super.initState();
  }

  Widget _buildAnexedImages(Size size) {
    if (widget.requirementId != null) {
      return const SizedBox();
    }
    return Column(
      children: <Widget>[
        const Text(
          'IMAGENS ANEXADAS',
          style: kHomeScreen,
        ),
        FutureBuilder(
            future: _getVisitImages,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Erro ao carregar imagens'),
                );
              } else {
                if (snapshot.data == null) {
                  return const Text('Nenhuma imagem encontrada');
                }
                var data = snapshot.data as List<dynamic>;
                if (data.isEmpty) {
                  return const Center(
                    child: Text('Esta denúncia não possui imagens'),
                  );
                } else {
                  final List<int> imageIds = [];
                  for (var element in data) {
                    imageIds.add(element['id']);
                  }
                  return SizedBox(
                    height: size.height * 0.3,
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const HorizontalSpacerBox(size: SpacerSize.small),
                        itemCount: imageIds.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return CachedNetworkImage(
                              httpHeaders: {
                                'Authorization': 'Bearer ' + _token,
                                'Accept': 'application/json'
                              },
                              imageUrl:
                                  'http://77.243.85.238:8003/api/denuncias/${widget.denunciaId}/fotos/${imageIds[index]}/arquivo');
                        })),
                  );
                }
              }
            })),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    _token = Provider.of<UserModel>(context, listen: false).token;
    print('token is $_token');
    controller = Provider.of<DetailsScreenController>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller?.clearWorkingImages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              widget.completedDate == null ? kDetailColor : kCompletedColor,
          centerTitle: true,
          title: widget.completedDate == null
              ? Image.asset(
                  'lib/assets/images/logo.png',
                  width: size.width * 0.2,
                )
              : Text(
                  'CONCLUÍDA EM ${CustomDateFormater.dateTimeToString(CustomDateFormater.stringToDateTime(widget.completedDate!))}'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.type.toUpperCase()} ID: ${widget.visitId}',
                      style: kHomeScreen,
                      textAlign: TextAlign.start,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    widget.text != null
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kDefaultRadius),
                            ),
                            color: widget.completedDate == null
                                ? kDetailColor
                                : kCompletedColor,
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              height: size.height * 0.25,
                              width: size.width * 0.85,
                              child: Column(children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(widget.text!,
                                      textAlign: TextAlign.start, style: kText),
                                ),
                              ]),
                            ),
                          )
                        : const SizedBox(),
                    // !!AQUI VAI AS IMAGENS ANEXADAS
                    _buildAnexedImages(size),
                    widget.requirementId != null
                        ? Container(
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => DocsDialog(
                                            companyId: widget.companyId,
                                            requirementId:
                                                widget.requirementId!,
                                          ));
                                },
                                child: const Text(
                                  'Visualizar Documentação',
                                  style: kUnderline,
                                )),
                          )
                        : const SizedBox(),
                    const Divider(color: kSecondaryTextColor),
                    widget.completedDate == null
                        ? InkWell(
                            onTap: () => controller!.selectImages(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'MÍDIA',
                                  style: kHomeScreen2,
                                ),
                                Icon(
                                  Icons.add_a_photo,
                                  color: kDetailColor,
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    !controller!.isUploadingImages
                        ? SizedBox(
                            child: controller!.selectedImageLength > 0 &&
                                    widget.completedDate == null
                                ? SizedBox(
                                    height: size.height * 0.2,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const HorizontalSpacerBox(
                                            size: SpacerSize.small);
                                      },
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller!.selectedImageLength,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ImageSelector(
                                            controller: controller,
                                            index: index);
                                      },
                                    ),
                                  )
                                : const Text(
                                    'Nenhuma imagem selecionada',
                                    style: TextStyle(color: kErrorColor),
                                  ),
                          )
                        : const Center(child: CircularProgressIndicator()),

                    const VerticalSpacerBox(size: SpacerSize.small),
                    !controller!.isUploadingImages
                        ? SizedBox(
                            child: controller!.selectedImageLength > 0
                                ? PrimaryButton(
                                    text: controller!.isUploadingImages
                                        ? 'Enviando imagens'
                                        : 'Enviar imagens',
                                    onPressed: () {
                                      controller!.sendVisitImages(
                                          visitId: widget.visitId,
                                          imagePath: controller!.imagePaths,
                                          context: context);
                                    })
                                : const SizedBox(),
                          )
                        : const SizedBox(),
                    const Divider(color: kSecondaryTextColor),
                    // TextButton(
                    //   onPressed: () {
                    //     controller!.setCommentSection =
                    //         !controller!.showCommentSection;
                    //   },
                    //   child: Center(
                    //     child: Text(
                    //       controller!.showCommentSection
                    //           ? 'Ocultar comentário'
                    //           : 'Adicionar Comentário',
                    //       style: kUnderline,
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                    // controller!.showCommentSection
                    //     ? Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Title(
                    //               color: kPrimaryColor,
                    //               child: const Text('COMENTÁRIO')),
                    //           const VerticalSpacerBox(size: SpacerSize.small),
                    //           SizedBox(
                    //             height: size.height * 0.09,
                    //             child: TextFormField(
                    //               maxLines: null,
                    //               keyboardType: TextInputType.multiline,
                    //               decoration: const InputDecoration(
                    //                   border: OutlineInputBorder(),
                    //                   fillColor: kPrimaryColor,
                    //                   hintText:
                    //                       'Comentários a respeito da fiscalização'),
                    //             ),
                    //           )
                    //         ],
                    //       )
                    //     : const SizedBox(),
                    const Text(
                      'Imagens enviadas da visita',
                      style: kHomeScreen,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    widget.completedDate != null
                        ? FutureBuilder(
                            future: _getVisitDoneImages,
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text('Erro ao carregar imagens'),
                                );
                              } else {
                                if (snapshot.data == null) {
                                  return const Text(
                                      'Nenhuma imagem encontrada');
                                }
                                var data = snapshot.data as List<dynamic>;
                                if (data.isEmpty) {
                                  return const Center(
                                    child: Text(
                                        'Esta denúncia não possui imagens'),
                                  );
                                } else {
                                  final List<int> imageIds = [];
                                  for (var element in data) {
                                    imageIds.add(element['id']);
                                  }
                                  return SizedBox(
                                    height: size.height * 0.3,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                        itemCount: imageIds.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: ((context, index) {
                                          return CachedNetworkImage(
                                              httpHeaders: {
                                                'Authorization':
                                                    'Bearer ' + _token,
                                                'Accept': 'application/json'
                                              },
                                              imageUrl:
                                                  'http://77.243.85.238:8003/api/visitas/12/fotos/18/arquivo');
                                        })),
                                  );
                                }
                              }
                            }))
                        : const SizedBox(),
                    const Divider(color: kSecondaryTextColor),

                    Row(
                      children: const [
                        Text('DETALHES DA VISITA', style: kDescription),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      children: [
                        //Modificar a partir do tipo
                        Text('Tipo de Visita: ${widget.type}',
                            style: kdrawerText),
                      ],
                    ),
                    Row(
                      //Modificar as datas
                      children: [
                        Text(
                            'Data Marcada: ${CustomDateFormater.dateTimeToString(CustomDateFormater.stringToDateTime(widget.eventDate))}',
                            style: kdrawerText),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            'Data de Criação: ${CustomDateFormater.dateTimeToString(CustomDateFormater.stringToDateTime(widget.creationDate))}',
                            style: kdrawerText),
                      ],
                    ),
                    const Divider(color: kSecondaryTextColor),
                    Row(
                      children: const [
                        Text('ENDEREÇO', style: kDescription),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    widget.city.isEmpty
                        ? const SizedBox()
                        : Text('Cidade: ${widget.city}', style: kdrawerText),

                    Text(
                        '${widget.street}  '
                        '${widget.adressNumber.isEmpty ? '' : widget.adressNumber}',
                        style: kdrawerText),
                    widget.city.isEmpty
                        ? const SizedBox()
                        : Text('Bairro: ${widget.district}',
                            style: kdrawerText),
                    widget.city.isEmpty
                        ? const SizedBox()
                        : Text('Complemento: ${widget.complement}',
                            style: kdrawerText),

                    widget.city.isEmpty
                        ? const SizedBox()
                        : Text('CEP: ${widget.cep}', style: kdrawerText),

                    const Divider(color: kSecondaryTextColor),
                    //Só aparece o requerente se for uma requisição, em caso de denuncia não aparece nenhuma dessas informações

                    widget.denunciante != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('DETALHES DO DENUNCIANTE',
                                  style: kDescription),
                              Text(
                                widget.denunciante!.isEmpty
                                    ? 'Não informado'
                                    : widget.denunciante!,
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text('DETALHES DO RESPONSÁVEL',
                                      style: kDescription),
                                ],
                              ),
                              const VerticalSpacerBox(size: SpacerSize.small),
                              Row(
                                children: [
                                  Text('Empresa: ${widget.companyName}',
                                      style: kdrawerText),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('CNPJ: ${widget.cnpj}',
                                      style: kdrawerText),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                                child: Row(
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: widget.phoneNumber))
                                              .then((value) => ScaffoldMessenger
                                                      .of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Telefone copiado para a área de transferência'))));
                                        },
                                        child: Text(
                                            'Telefone: ${widget.phoneNumber}',
                                            style: kdrawerText)),
                                    const Icon(Icons.copy)
                                  ],
                                ),
                              ),
                              Text(
                                'E-mail: ${widget.email}',
                                textAlign: TextAlign.start,
                                style: kdrawerText,
                              ),
                            ],
                          ),

                    const VerticalSpacerBox(size: SpacerSize.medium),
                    widget.completedDate == null
                        ? PrimaryButton(
                            text: 'Concluir Visita',
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      FinishVisitDialog(id: widget.visitId));
                            })
                        : const Center(
                            child: Text('Esta visita já foi concluída')),
                  ],
                ),
              ),
            )));
  }
}
