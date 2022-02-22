import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import '../email auth/email_autentication_screen.dart';

class NewRegister extends StatelessWidget {
  static const String id = 'new_register';
  const NewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
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
                  'Cadastro',
                  textAlign: TextAlign.center,
                  style: textTheme.headline5,
                ),
                const VerticalSpacerBox(size: SpacerSize.small),
                const VerticalSpacerBox(size: SpacerSize.small),
                const VerticalSpacerBox(size: SpacerSize.small),
                const VerticalSpacerBox(size: SpacerSize.small),
                const AuthFormField(label: 'Nome'),
                const VerticalSpacerBox(size: SpacerSize.small),
                const AuthFormField(label: 'Email'),
                const VerticalSpacerBox(size: SpacerSize.small),
                const AuthFormField(label: 'Senha'),
                const VerticalSpacerBox(size: SpacerSize.small),
                const AuthFormField(label: 'Repita a Senha'),
                const VerticalSpacerBox(size: SpacerSize.small),
                const VerticalSpacerBox(size: SpacerSize.small),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EmailAutenticationScreen.id);
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
