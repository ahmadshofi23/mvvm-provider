import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/components/app_title.dart';
import 'package:mvvmwithprovider/user_list/viewmodels/user_viewmodel.dart';
import 'package:provider/src/provider.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.selectedUser.name.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userViewModel.selectedUser.name.toString(),
            ),
            Text(
              userViewModel.selectedUser.email.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
