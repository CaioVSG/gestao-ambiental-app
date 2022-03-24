import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

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
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: kDetailColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: CircleAvatar(
                  radius: (80),
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset('lib/assets/images/eu.png'),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'John Doe',
                style: KProfileStyle,
              )),
            ),
            const VerticalSpacerBox(size: SpacerSize.large),
            const Text('Email: ', style: kdrawerText),
          ]),
        ),
      ),
    );
  }
}
