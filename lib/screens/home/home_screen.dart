import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/core/models/visits_model.dart';
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
        child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              final UserModel userModel =
                  Provider.of<UserModel>(context, listen: false);
              print(userModel.refreshToken);
            }),
            appBar: AppBar(),
            drawer: const CustomDrawer(),
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
                          Text('Visitas agendadas'.toUpperCase(),
                              style: kTitleStyles),
                          const VerticalSpacerBox(size: SpacerSize.large),
                          SizedBox(
                            height: size.height * 0.7,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const VerticalSpacerBox(
                                    size: SpacerSize.small);
                              },
                              itemCount: 2,
                              itemBuilder: ((context, index) {
                                return Card(
                                  child: Container(
                                    height: size.height * 0.17,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kDefaultRadius)),
                                    child: VisitTile(
                                      title: 'Posto Delta',
                                      VisitDate: 'asd',
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
