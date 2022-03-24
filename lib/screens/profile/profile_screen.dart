import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
//import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

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
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // ignore: unnecessary_const
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                  ),
                ),
              )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  'CJ',
                  style: KProfileStyle,
                )),
              ),

              const VerticalSpacerBox(size: SpacerSize.small),
              const Text('Email: johndoe@example.com', style: KHomeScreen),
              const VerticalSpacerBox(size: SpacerSize.small),
              const Text('CPF: 123.456.789-00',
                  textAlign: TextAlign.start, style: KHomeScreen),
              const VerticalSpacerBox(size: SpacerSize.small),
              const Text('RG: 12.345.678',
                  textAlign: TextAlign.start, style: KHomeScreen),
              const VerticalSpacerBox(size: SpacerSize.small),
              const Text('SDS: 81 912345678',
                  textAlign: TextAlign.start, style: KHomeScreen),
              //   const Spacer(),
              //   Text('Sair'.toUpperCase(), style: kdrawerText),
              //   IconButton(
              //     icon: const Icon(
              //       Icons.exit_to_app,
              //       color: kDetailColor,
              //     ),
              //     onPressed: () {
              //       Navigator.popAndPushNamed(context, SignInScreen.id);
              //     },
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
