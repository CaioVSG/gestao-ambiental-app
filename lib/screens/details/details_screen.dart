import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/details/components/docs_screen.dart';
import 'package:meioambientemobile/screens/details/components/finish_details_dialog.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/edit%20image/edit_image_screen.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String id = 'details_screen';
  const DetailsScreen({
    Key? key,
    required this.eventDate,
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
    required this.companyName,
    required this.email,
  }) : super(key: key);

  final String eventDate;
  final String creationDate;
  final String adress;

  final String street;
  final String adressNumber;
  final String district;
  final String city;
  final String complement;
  final String cep;

  final String cnpj;
  final String companyName;
  final String phoneNumber;
  final String email;

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
    DateTime data;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'lib/assets/images/logo.png',
              width: size.width * 0.25,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, ProfileScreen.id);
              },
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'DENÚNCIA AMBIENTAL',
                          style: kHomeScreen,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      color: kDetailColor,
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        height: size.height * 0.25,
                        width: size.width * 0.85,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text('Descrição',
                                textAlign: TextAlign.start, style: kText),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const DocsDialog());
                        },
                        child: const Text(
                          'Visualizar Documentação',
                          style: kUnderline,
                        ),
                      ),
                    ),
                    const Divider(color: kSecondaryTextColor),
                    InkWell(
                      onTap: () => controller!.selectImages(),
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
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    controller!.selectedImageLength > 0
                        ? SizedBox(
                            height: size.height * 0.1,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const HorizontalSpacerBox(
                                    size: SpacerSize.small);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller!.selectedImageLength,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    controller!.selectedImageIndex = index;
                                    Navigator.pushNamed(
                                        context, EditImageScreen.id);
                                  },
                                  // child: Text(
                                  //     controller!.selectedImages[index].path)
                                  child: Image.file(
                                    controller!.selectedImages[index],
                                    width: size.width * 0.2,
                                  ),
                                );
                              },
                            ),
                          )
                        : const Text(
                            'Nenhuma imagem selecionada',
                            style: TextStyle(color: kErrorColor),
                          ),
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
                        Text('Data Marcada: ${widget.eventDate}',
                            style: kdrawerText),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Data de Criação: ${widget.creationDate}',
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
                    Text('Rua: ${widget.street}', style: kdrawerText),
                    Text('Número: ${widget.adressNumber}', style: kdrawerText),
                    Text('Complemento: ${widget.complement}',
                        style: kdrawerText),
                    Text('Bairro: ${widget.district}', style: kdrawerText),
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
                        Text(widget.companyName, style: kdrawerText),
                      ],
                    ),
                    Row(
                      children: [
                        Text('CNPJ: ${widget.cnpj}', style: kdrawerText),
                      ],
                    ),

                    Text('Telefone: ${widget.phoneNumber}', style: kdrawerText),
                    Text(
                      'email: ${widget.email}',
                      style: kdrawerText,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    PrimaryButton(
                        text: 'Concluir Visita',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const FinishVisitDialog());
                        }),
                  ],
                ),
              ),
            )));
  }
}
