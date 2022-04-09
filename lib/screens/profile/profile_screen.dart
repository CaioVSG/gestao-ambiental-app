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
          /*title: Image.asset(
              'lib/assets/images/logo.png',
              width: size.width * 0.25,
            ),*/
          title: const Text('Perfil'),
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
                    //Vem uma URL na foto não sei se da p colocar aqui
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                  ),
                ),
              )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  'CJ',
                  style: kProfileStyle,
                )),
              ),
              //Só envia o endereço de email na API
              const VerticalSpacerBox(size: SpacerSize.large),
              const Center(child: Text('Email: ', style: kHomeScreen)),
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
