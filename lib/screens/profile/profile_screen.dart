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
              const VerticalSpacerBox(size: SpacerSize.medium),
              Center(
                child: Column(
                  children: const [
                    VerticalSpacerBox(size: SpacerSize.small),
                    Text('E-MAIL', style: KDescription),
                    Text('johndoe@example.com', style: KProfile),
                    VerticalSpacerBox(size: SpacerSize.small),
                    Text('CONTATO', style: KDescription),
                    Text('(12) 3456-7890', style: KProfile),
                    VerticalSpacerBox(size: SpacerSize.small),
                    Text('FUNÇÃO', style: KDescription),
                    Text('Analista', style: KProfile),
                  ],
                ),
              ),

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
