import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class AuthFormField extends StatelessWidget {
  final String label;

  const AuthFormField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kLargeHeight,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: kDetailColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
