import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorText;
  AppError({required this.errorText});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText.isNotEmpty,
      child: Container(
        child: Text(
          errorText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
