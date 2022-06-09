import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

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
          title: const Text('Perfil'),
          backgroundColor: kDetailColor,
        ),
        body: Container(
          width: size.width,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                    radius: 62,
                    backgroundImage: NetworkImage(
                        Provider.of<UserModel>(context, listen: false)
                            .profilePhotoUrl)),
              ),
              Text(Provider.of<UserModel>(context, listen: false).name,
                  style: kProfileStyle),
              Text(
                  'Email: ${Provider.of<UserModel>(context, listen: false).email}',
                  style: kdrawerText),
              const Divider(),
              const VerticalSpacerBox(size: SpacerSize.medium),
              TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Sair'),
                              content: const Text('Deseja realmente sair?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  child: const Text('Sair'),
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        SignInScreen.id, (route) => false);
                                  },
                                ),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Sair'))
            ],
          ),
        ),
      ),
    );
  }
}
