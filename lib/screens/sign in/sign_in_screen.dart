import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/auth_form_field.dart';
import 'package:meioambientemobile/components/primary_button.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<SignInController>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              height: size.height * 0.7,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      width: size.width * 0.4,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    AuthFormField(
                        onChanged: (String value) =>
                            _controller.setEmail(value),
                        label: 'Email',
                        isPassword: false,
                        inputType: TextInputType.emailAddress),
                    const VerticalSpacerBox(size: SpacerSize.tiny),
                    AuthFormField(
                        onChanged: (String value) =>
                            _controller.setPassword(value),
                        label: 'Senha',
                        isPassword: true,
                        inputType: TextInputType.visiblePassword),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    context.watch<SignInController>().isLoading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Entrar',
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                context
                                    .read<SignInController>()
                                    .signIn(context);
                              }
                            },
                          ),
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
