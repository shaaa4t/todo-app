import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function(String val)? onSubmit;
  final Function(String val)? onChange;
  final String? Function(String? val)? validate;
  final Function()? onTap;
  final String label;
  final IconData preifx;
  final bool isClickable;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required this.validate,
    required this.label,
    required this.preifx,
    this.isClickable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      readOnly: isClickable,
      decoration: InputDecoration(
        label: Text(label),
        prefix: Icon(preifx),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
