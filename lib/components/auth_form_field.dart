import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class AuthFormField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType inputType;
  final Function(String) onChanged;

  const AuthFormField(
      {Key? key,
      required this.label,
      required this.isPassword,
      required this.inputType,
      required this.onChanged})
      : super(key: key);

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kLargeHeight,
      child: TextFormField(
        onChanged: widget.onChanged,
        style: const TextStyle(color: kTextColor),
        obscureText: widget.isPassword ? showPassword : false,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: kDetailColor))
              : null,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kDetailColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
