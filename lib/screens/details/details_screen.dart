import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DetailsScreenController();
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDetailColor,
        title: Text('Visita'.toUpperCase()),
      ),
      body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POSTO DELTA',
                style: textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                ),
                color: kPrimaryColor,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: size.height * 0.3,
                  width: size.width * 0.92,
                  child: Column(children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('RAZÃO DA VISITA',
                          textAlign: TextAlign.start,
                          style: textTheme.bodyText1),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Denuncia Ambiental',
                        textAlign: TextAlign.start,
                        style: textTheme.headline6,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'RESPONSÁVEL',
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: kSecondaryTextColor, fontSize: 16),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'José da Silva',
                        textAlign: TextAlign.start,
                        style: textTheme.headline6,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Data'.toUpperCase(),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: kSecondaryTextColor, fontSize: 16),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12/12/2022',
                        textAlign: TextAlign.start,
                        style: textTheme.headline6,
                      ),
                    )
                  ]),
                ),
              ),
              Center(child: const Text('NENHUMA FOTO FOI ADICIONADA AINDA')),
              SizedBox(
                height: size.height * 0.15,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const HorizontalSpacerBox(size: SpacerSize.small);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: size.height,
                      width: size.width * 0.4,
                      color: Colors.red,
                      child: Text('Foto'),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () => controller.selectImages(),
                child: Card(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Anexar fotos'),
                      Icon(
                        Icons.add_a_photo,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: kSecondaryTextColor),
              Text('Tipo de Visita: ',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('Data Marcada: ',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('Data de Criação: ',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Divider(color: kSecondaryTextColor),
              Text('Pernambuco',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('Garanhuns',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('55415-000',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('São José',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('Rua da Flores',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('Nº 146',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Divider(color: kSecondaryTextColor),
              Text('CPF: 123.456.789-00',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('RG: 12.345.678',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Text('SDS: 81 912345678',
                  textAlign: TextAlign.start, style: textTheme.bodyText1),
              Spacer(),
              Text('Rua das Flores', style: kdrawerText),
              Center(
                child: CircleAvatar(
                  radius: (40),
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('lib/assets/images/logo.png'),
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(text: 'Concluir Visita', onPressed: () {}),
            ],
          )),
    );
  }
}
