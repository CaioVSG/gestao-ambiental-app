import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/util/custom_date_formater.dart';
import 'package:meioambientemobile/screens/details/components/docs_dialog.dart';
import 'package:meioambientemobile/screens/details/components/finish_details_dialog.dart';
import 'package:meioambientemobile/screens/details/components/image_selector.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/edit%20image/edit_image_screen.dart';
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
      this.requirementId})
      : super(key: key);
  final int denunciaId;
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

  final int? requirementId;

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenController? controller;
  @override
  void didChangeDependencies() {
    controller = Provider.of<DetailsScreenController>(context);
    super.didChangeDependencies();
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
                  width: size.width * 0.25,
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
                      widget.type.toUpperCase(),
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
                            child: controller!.selectedImageLength > 0
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
                                          visitId: widget.denunciaId,
                                          imagePath: controller!.imagePaths,
                                          context: context);
                                    })
                                : const SizedBox(),
                          )
                        : const SizedBox(),
                    const Divider(color: kSecondaryTextColor),
                    TextButton(
                      onPressed: () {
                        controller!.setCommentSection =
                            !controller!.showCommentSection;
                      },
                      child: Center(
                        child: Text(
                          controller!.showCommentSection
                              ? 'Ocultar comentário'
                              : 'Adicionar Comentário',
                          style: kUnderline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    controller!.showCommentSection
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Title(
                                  color: kPrimaryColor,
                                  child: const Text('COMENTÁRIO')),
                              const VerticalSpacerBox(size: SpacerSize.small),
                              SizedBox(
                                height: size.height * 0.09,
                                child: TextFormField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: kPrimaryColor,
                                      hintText:
                                          'Comentários a respeito da fiscalização'),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),

                    const Divider(color: kSecondaryTextColor),
                    Row(
                      children: const [
                        Text('DETALHES DA VISITA', style: kDescription),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      children: const [
                        //Modificar a partir do tipo
                        Text('Tipo de Visita: Denúncia', style: kdrawerText),
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
                    Text('Cidade: ${widget.city}', style: kdrawerText),
                    Text(
                        'Rua: ${widget.street} - '
                        ' Nº: ${widget.adressNumber}',
                        style: kdrawerText),
                    Text('Bairro: ${widget.district}', style: kdrawerText),
                    Text('Complemento: ${widget.complement}',
                        style: kdrawerText),

                    Text('CEP: ${widget.cep}', style: kdrawerText),

                    const Divider(color: kSecondaryTextColor),
                    //Só aparece o requerente se for uma requisição, em caso de denuncia não aparece nenhuma dessas informações
                    Row(
                      children: const [
                        Text('DETALHES DO RESPONSÁVEL', style: kDescription),
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
                        Text('CNPJ: ${widget.cnpj}', style: kdrawerText),
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
                                Clipboard.setData(
                                        ClipboardData(text: widget.phoneNumber))
                                    .then((value) => ScaffoldMessenger.of(
                                            context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                                'Telefone copiado para a área de transferência'))));
                              },
                              child: Text('Telefone: ${widget.phoneNumber}',
                                  style: kdrawerText)),
                          const Icon(Icons.copy)
                        ],
                      ),
                    ),
                    Text(
                      'E-mail: ${widget.email}',
                      style: kdrawerText,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    widget.completedDate == null
                        ? PrimaryButton(
                            text: 'Concluir Visita',
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      FinishVisitDialog(id: widget.denunciaId));
                            })
                        : const Center(
                            child: Text('Esta visita já foi concluída')),
                  ],
                ),
              ),
            )));
  }
}
