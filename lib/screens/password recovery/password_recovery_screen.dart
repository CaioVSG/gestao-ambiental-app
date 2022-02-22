import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';

import '../email auth/email_autentication_screen.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  static const String id = 'password_recovery_screen';
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        backgroundColor: kDetailColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Center(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              height: size.height * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Digite o Seu Email',
                      textAlign: TextAlign.left,
                      style: textTheme.headline5,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const AuthFormField(
                        label: 'Email',
                        isPassword: false,
                        inputType: TextInputType.emailAddress),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    PrimaryButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, EmailAutenticationScreen.id);
                      },
                      text: 'Recuperar senha',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
