import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/components/custom_text_button.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/password%20recovery/password_recovery_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_bloc.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _controller = SignInController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Center(
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                height: size.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sistema de Gestão Ambiental - SGA',
                      textAlign: TextAlign.center,
                      style: textTheme.headline5,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const AuthFormField(label: 'Email'),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const AuthFormField(label: 'Senha'),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    context.watch<SignInController>().isLoading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Entrar',
                            onPressed: () {
                              context.read<SignInController>().signIn(context);
                            },
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Esqueceu sua Senha?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PasswordRecoveryScreen.id);
                            },
                            child: const Text(
                              'Toque Aqui',
                              style: kTextButtonTextStyle,
                            )),
                      ],
                    ),
                    const Text('ou'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cadastre-se',
                          style: kTextButtonTextStyle,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
