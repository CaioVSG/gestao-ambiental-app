import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/screens/email%20auth/components/code_verification_dialog.dart';
// import 'package:meioambientemobile/components/number_form_field.dart';
import 'package:meioambientemobile/screens/password%20recovery/change_password_screen.dart';

import '../../components/number_form_field.dart';

class EmailAutenticationScreen extends StatelessWidget {
  static const String id = 'email_autentication_screen';
  const EmailAutenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: kDetailColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Center(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              height: size.height * 0.8,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Digite o código enviado para seu email',
                  textAlign: TextAlign.left,
                  style: textTheme.headline5,
                ),
                const VerticalSpacerBox(size: SpacerSize.small),
                const NumberFormField(label: 'Seu código'),
                const VerticalSpacerBox(size: SpacerSize.medium),
                PrimaryButton(
                  text: 'Confirmar',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const CodeVerificationDialog());
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
