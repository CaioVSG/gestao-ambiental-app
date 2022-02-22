import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/screens/password%20recovery/components/password_confirmation_dialog.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String id = 'change_password_screen';
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Digite sua nova senha',
                      textAlign: TextAlign.left,
                      style: textTheme.headline5,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const AuthFormField(
                        label: 'Nova Senha',
                        isPassword: true,
                        inputType: TextInputType.visiblePassword),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    PrimaryButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const PasswordConfirmationDialog());
                      },
                      text: 'Confirmar',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
