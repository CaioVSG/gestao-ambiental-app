import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import '../email auth/email_autentication_screen.dart';

class NewRegisterScreen extends StatelessWidget {
  static const String id = 'new_register';
  const NewRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: kDetailColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            width: size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: textTheme.headline5,
                  ),
                  const VerticalSpacerBox(size: SpacerSize.medium),
                  const AuthFormField(
                      label: 'Nome',
                      isPassword: false,
                      inputType: TextInputType.name),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  const AuthFormField(
                      label: 'Email',
                      isPassword: false,
                      inputType: TextInputType.emailAddress),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  const AuthFormField(
                      label: 'Senha',
                      isPassword: true,
                      inputType: TextInputType.visiblePassword),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  PrimaryButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, EmailAutenticationScreen.id);
                    },
                    text: 'Cadastrar',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
