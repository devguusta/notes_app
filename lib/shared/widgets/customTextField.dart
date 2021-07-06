import 'package:flutter/material.dart';


class InputForm extends StatelessWidget {
  final String hintText;
  
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

   const InputForm({
    Key? key,
    required this.hintText,
    
    this.validator,
     this.onChanged,
    this.controller,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator:  validator,
        decoration: InputDecoration(
          
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(141,141,141,1),
          ),
          fillColor:  Color.fromRGBO(255,255,255,1),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.all(22),
        ),
      ),
    );
  }
}