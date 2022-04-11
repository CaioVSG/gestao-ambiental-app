import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  const ProfileScreen(
      {Key? key,
      required this.email,
      required this.name,
      required this.profilePhotoUrl})
      : super(key: key);

  final String email;
  final String name;
  final String profilePhotoUrl;

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          /*title: Image.asset(
              'lib/assets/images/logo.png',
              width: size.width * 0.25,
            ),*/

          title: const Center(child: Text('Perfil')),
          backgroundColor: kDetailColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 350,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: kDetailColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24)),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Text(widget.name, style: kProfileStyle),
                  ],
                ),
              ),
              //Só envia o endereço de email na API
              const VerticalSpacerBox(size: SpacerSize.large),
              Center(
                child: Row(
                  children: [
                    Text('Email: ${widget.email}', style: kdrawerText),
                  ],
                ),
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              //Não vem o cpf nem rg do user
              /*const Center(
                child: Text('CPF: 123.456.789-00',
                    textAlign: TextAlign.start, style: kHomeScreen),
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              const Center(
                child: Text('RG: 12.345.678',
                    textAlign: TextAlign.start, style: kHomeScreen),
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              const Center(
                child: Text('SDS: 81 912345678',
                    textAlign: TextAlign.start, style: kHomeScreen),
              ),
              */
              const Spacer(),
              Center(
                child: Image.asset('lib/assets/images/logo.png',
                    width: size.width * 0.3),
              ),
              const Divider(color: kSecondaryTextColor),
            ],
          ),
        ),
      ),
    );
  }
}
