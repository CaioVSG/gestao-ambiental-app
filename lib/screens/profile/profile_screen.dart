import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:provider/provider.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
