import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
<<<<<<< HEAD
=======
import 'package:meioambientemobile/core/models/visits_model.dart';
>>>>>>> 7435b51ce8c6f375749712d60cdbbb5420d95915
import 'package:meioambientemobile/screens/details/details_screen.dart';
import 'package:meioambientemobile/screens/home/home_screen_controller.dart';
import 'package:provider/provider.dart';
import 'components/custom_drawer.dart';
import 'components/visit_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // HomeScreenController().getAllVisits(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
<<<<<<< HEAD
        child: Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: FutureBuilder(
          future: Api().getAllVisits(context),
          builder: ((context, snapshot) {
            print(snapshot.data.runtimeType);
            Object? list = snapshot.data;

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visitas agendadas'.toUpperCase(), style: kTitleStyles),
                  const VerticalSpacerBox(size: SpacerSize.large),
                  SizedBox(
                    height: size.height * 0.7,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const VerticalSpacerBox(size: SpacerSize.small);
                      },
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: Container(
                            height: size.height * 0.17,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultRadius)),
                            child: VisitTile(
                              title: 'Posto Delta',
                              VisitDate: '12/12/2020',
                              CriationDate: '10/03/2022',
                              business: 'LMTS',
                              tipo: 'Denúncia',
                              onTap: () {
                                Navigator.pushNamed(context, DetailsScreen.id);
                              },
                            ),
                          ),
<<<<<<< HEAD
                        );
                      }),
                    ),
=======
                        ),
                      );
                    }),
                    itemCount: 1,
>>>>>>> 2d943b2f8cc3712a6e00765df32471b17a9b550e
                  ),
                ],
              );
            }
          }),
        ),
=======
      child: Scaffold(
        appBar: AppBar(),
        drawer: const CustomDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Visitas agendadas'.toUpperCase(), style: kTitleStyles),
                //Icon(Icons.add_circle_outline,
                //color: kDetailColor, size: size.width * 0.09),
                const VerticalSpacerBox(size: SpacerSize.large),
                FutureBuilder(
                    future: Api().getAllVisits(context),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final List<dynamic> dataList =
                            snapshot.data as List<dynamic>;
                        final visitsModel =
                            VisitsModel(visitDate: '2020-01-01');
                        return SizedBox(
                          height: size.height * 0.7,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const VerticalSpacerBox(
                                  size: SpacerSize.small);
                            },
                            itemCount: dataList.length,
                            itemBuilder: ((context, index) {
                              return Card(
                                child: Container(
                                  height: size.height * 0.17,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          kDefaultRadius)),
                                  child: VisitTile(
                                    title: 'Posto Delta',
                                    VisitDate: visitsModel.visitDate,
                                    CriationDate: '10/03/2022',
                                    business: 'LMTS',
                                    tipo: 'Denúncia',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, DetailsScreen.id);
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
              ],
            )),
>>>>>>> 7435b51ce8c6f375749712d60cdbbb5420d95915
      ),
    ));
  }
}
