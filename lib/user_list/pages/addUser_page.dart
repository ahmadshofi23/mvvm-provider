import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/user_list/viewmodels/user_viewmodel.dart';
import 'package:provider/src/provider.dart';

class AddUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = await userViewModel.addUsers();
                if (!userAdded) {
                  return;
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //input name
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              onChanged: (val) async {
                userViewModel.addUser.name = val;
              },
            ),
            SizedBox(height: 10),
            //input email
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (val) async {
                userViewModel.addUser.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
