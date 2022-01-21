import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/user_list/pages/addUser_page.dart';
import 'package:mvvmwithprovider/user_list/pages/user_detail.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetail(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddUserPage(),
    ),
  );
}
