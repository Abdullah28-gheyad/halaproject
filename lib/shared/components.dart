import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextFormField({
  @required var controller,
  @required Function function,
  @required String label,
  IconData prefixIcon,
  var type = TextInputType.text,
  bool secure = false,
  Function onTap,
}) =>
    TextFormField(
      onTap: onTap,
      controller: controller,
      obscureText: secure,
      validator: function,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
