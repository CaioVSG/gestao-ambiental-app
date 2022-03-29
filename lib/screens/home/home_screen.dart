import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/screens/details/details_screen.dart';
import 'package:meioambientemobile/screens/home/home_screen_controller.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'components/visit_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

late Future getAllVisits;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getAllVisits = Api().getAllVisits(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
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
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: FutureBuilder(
                future: getAllVisits,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    // List<dynamic> dataList = snapshot.data as List<dynamic>;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Visitas'.toUpperCase(), style: kTitleStyles),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          SizedBox(
                            height: size.height * 0.75,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const VerticalSpacerBox(
                                    size: SpacerSize.tiny);
                              },
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return Card(
                                  color: kDetailColor,
                                  child: Container(
                                    height: size.height * 0.23,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kSmallHeight)),
                                    child: VisitTile(
                                      title:
                                          'Av, Caruaru, B. Heliópolis, n. 123',
                                      VisitDate: '25/03/2022',
                                      hora: '15:00',
                                      empresa: 'LMTS',
                                      tipo: 'Denúncia',
                                      business: '',
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.id);
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            )));
  }
}
