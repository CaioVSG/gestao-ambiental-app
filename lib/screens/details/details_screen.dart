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

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';
  const DetailsScreen({Key? key}) : super(key: key);

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'DENÚNCIA AMBIENTAL',
                        style: KHomeScreen,
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
                              textAlign: TextAlign.start, style: KText),
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
                            builder: (context) => const DocsScreen());
                      },
                      child: const Text(
                        'Visualizar Documentação',
                        style: KUnderline,
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
                          style: KHomeScreen2,
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
                          onTap: () =>
                              Navigator.pushNamed(context, EditImageScreen.id),
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
                      style: KUnderline,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(color: kSecondaryTextColor),
                  Row(
                    children: const [
                      Text('DETALHES DA VISITA', style: KDescription),
                    ],
                  ),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: const [
                      Text('Tipo de Visita: Denúncia', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Data Marcada: 25/03/2022', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Data de Criação: 19/03/2022', style: kdrawerText),
                    ],
                  ),
                  const Divider(color: kSecondaryTextColor),
                  Row(
                    children: const [
                      Text('ENDEREÇO', style: KDescription),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Text('CEP: 55295-123', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Garanhuns/PE', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('End.¹: Av. Caruaru, n. 123', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('End.²: B. Heliópolis', style: kdrawerText),
                    ],
                  ),
                  const Divider(color: kSecondaryTextColor),
                  Row(
                    children: const [
                      Text('DETALHES DO RESPONSÁVEL', style: KDescription),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Text('Nome: Jane Dough', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('CPF: 123.456.789-00', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('RG: 12.345.678', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Contato: (12) 3456-7890', style: kdrawerText),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('E-mail:', style: kdrawerText),
                      TextButton(
                        onPressed: () {
                          //Navigator.push(context, route);
                        },
                        child: const Text(
                          'janedough@example.com',
                          style: kdrawerText,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: PrimaryButton(
                        text: 'Concluir Visita',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const FinishVisitDialog());
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
