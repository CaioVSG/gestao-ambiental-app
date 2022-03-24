import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/details/components/finish_details_dialog.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
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
              height: size.height * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DENÚNCIA AMBIENTAL',
                    style: KHomeScreen,
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    color: kDetailColor,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: size.height * 0.2,
                      width: size.width * 0.92,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text('Descrição',
                              textAlign: TextAlign.start, style: KText),
                        ),
                      ]),
                    ),
                  ),
                  const Divider(color: kSecondaryTextColor),
                  InkWell(
                    onTap: () => controller.selectImages(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'MÍDIA',
                          style: KHomeScreen2,
                        ),
                        Spacer(),
                        Icon(
                          Icons.add_a_photo,
                          color: kDetailColor,
                        ),
                      ],
                    ),
                  ),
                  //onTap: () => controller.selectImages(),
                  const Spacer(),
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
                        return Container(
                          height: size.height,
                          width: size.width * 0.2,
                          color: kDetailColor,
                          child: const Icon(
                            Icons.image,
                            color: kPrimaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: PrimaryButton(
                        text: 'Concluir Visita',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const FinishVisitDialog());
                        }),
                  ),
                  const Divider(color: kSecondaryTextColor),
                  const Text('DETALHES DA VISITA', style: KDescription),
                  const Spacer(),
                  const Text('Tipo de Visita: ',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('Data Marcada: ',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('Data de Criação: ',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Divider(color: kSecondaryTextColor),
                  const Text('ENDEREÇO', style: KDescription),
                  const Spacer(),
                  const Text('Pernambuco',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('Garanhuns',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('55415-000',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('São José',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('Rua da Flores',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('Nº 146',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Divider(color: kSecondaryTextColor),
                  const Text('DETALHES DO RESPONSÁVEL', style: KDescription),
                  const Spacer(),
                  const Text('CPF: 123.456.789-00',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('RG: 12.345.678',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Text('SDS: 81 912345678',
                      textAlign: TextAlign.start, style: kdrawerText),
                  const Spacer(),
                ],
              ),
            ),
          )),
    );
  }
}
