import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDetailColor,
        title: const Text('Visita'),
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
              InkWell(
                onTap: () {},
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
                    )
                    // child: SizedBox(
                    //   height: size.height * 0.2,
                    //   width: size.width * 0.92,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) {
                    //         return Text('asasd');
                    //       }),
                    // ),
                    ),
              ),
              const Spacer(),
              PrimaryButton(text: 'Concluir Visita', onPressed: () {}),
            ],
          )),
    );
  }
}
