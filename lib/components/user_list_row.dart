import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/user_list/models/user_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModels userModels;
  final VoidCallback onTap;
  UserListRow({required this.userModels, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userModels.name.toString(),
            ),
            Text(
              userModels.email.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
