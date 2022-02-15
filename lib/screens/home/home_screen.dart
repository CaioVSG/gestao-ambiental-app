import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visitas agendadas'.toUpperCase(),
                  style: textTheme.headline4,
                ),
                const VerticalSpacerBox(size: SpacerSize.medium),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const VerticalSpacerBox(size: SpacerSize.small);
                  },
                  itemBuilder: ((context, index) {
                    return Container(
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                          color: kDetailColor,
                          borderRadius: BorderRadius.circular(kDefaultRadius)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Posto Delta'), Text('03/04/2022')]),
                    );
                  }),
                  itemCount: 5,
                ),
              ],
            )),
      ),
    );
  }
}
