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

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    final controller = Provider.of<HomeScreenController>(context);
    controller.getAllVisits(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              final UserModel userModel =
                  Provider.of<UserModel>(context, listen: false);
              print(userModel.refreshToken);
            }),
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
              child: FutureBuilder(
                future: Api().getAllVisits(context),
                builder: ((context, snapshot) {
                  List<dynamic> dataList = snapshot.data as List<dynamic>;
                  if (snapshot.hasData) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Visitas'.toUpperCase(), style: kTitleStyles),
                          const VerticalSpacerBox(size: SpacerSize.tiny),
                          SizedBox(
                            height: size.height * 0.79,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const VerticalSpacerBox(
                                    size: SpacerSize.small);
                              },
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                return Card(
                                  child: Container(
                                    height: size.height * 0.2,
                                    decoration: BoxDecoration(
                                        color: kDetailColor,
                                        borderRadius: BorderRadius.circular(
                                            kSmallHeight)),
                                    child: VisitTile(
                                      title:
                                          'Av, Caruaru, B. Heliópolis, n. 123',
                                      VisitDate: '25/03/2022',
                                      hora: '15:00',
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
