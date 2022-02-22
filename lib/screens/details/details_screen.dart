import 'package:flutter/material.dart';
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
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              padding: const EdgeInsets.only(top: 20),
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: kDetailColor,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: size.height * 0.3,
                      width: size.width * 0.92,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'RAZÃO DA VISITA',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kSecondaryTextColor, fontSize: 16),
                          ),
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
                            style: TextStyle(
                                color: kSecondaryTextColor, fontSize: 16),
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
                            'Data',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kSecondaryTextColor, fontSize: 16),
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
                ],
              ))),
    );
  }
}
