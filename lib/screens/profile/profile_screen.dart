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
          backgroundColor: kDetailColor,
          title: Text('Perfil'.toUpperCase()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: CircleAvatar(
                    radius: (90),
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('lib/assets/images/logo.png'),
                    ))),
            const VerticalSpacerBox(size: SpacerSize.large),
            Text('Nome: ', style: kTitleStyles),
            Text('Email: ', style: kTitleStyles),
          ]),
        ),
      ),
    );
  }
}
