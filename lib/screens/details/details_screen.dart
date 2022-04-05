import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/models/visits_model.dart';
import 'package:meioambientemobile/screens/details/components/docs_screen.dart';
import 'package:meioambientemobile/screens/details/components/finish_details_dialog.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/edit%20image/edit_image_screen.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../core/api.dart';

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
  @override
  void didChangeDependencies() {
    final controller = Provider.of<DetailsScreenController>(context);
    controller.getAllVisits(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final controller = DetailsScreenController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
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
                height: size.height * 1.13,
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
                    const Spacer(),
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
                      onTap: () => controller.selectImages(),
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
                    SizedBox(
                      height: size.height * 0.1,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const HorizontalSpacerBox(
                              size: SpacerSize.small);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, EditImageScreen.id),
                            child: Container(
                              width: size.width * 0.2,
                              color: kDetailColor,
                              child: const Icon(
                                Icons.image,
                                color: kPrimaryColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    const Divider(color: kSecondaryTextColor),
                    TextButton(
                      onPressed: () {
                        Title(
                            color: kPrimaryColor,
                            child: const Text('COMENTÁRIO'));

                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Comentários a respeito da fiscalização'),
                          ),
                        );
                      },
                      child: const Text(
                        'Adicionar Comentário',
                        style: kUnderline,
                        textAlign: TextAlign.center,
                      ),
                    ),
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

                    Text('Rua: ${widget.street}', style: kdrawerText),
                    Text('Número: ${widget.adressNumber}', style: kdrawerText),
                    Text('CEP: ${widget.cep}', style: kdrawerText),
                    Text('COMPLEMENTO: ${widget.complement}',
                        style: kdrawerText),
                    Text('BAIRRO: ${widget.district}', style: kdrawerText),
                    Text('CIDADE: ${widget.city}', style: kdrawerText),

                    const Divider(color: kSecondaryTextColor),
                    //Só aparece o requerente se for uma requisição, em caso de denuncia não aparece nenhuma dessas informações
                    Row(
                      children: const [
                        Text('DETALHES DO RESPONSÁVEL', style: kDescription),
                      ],
                    ),
                    const Spacer(),
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
