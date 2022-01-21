import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/components/app_error.dart';
import 'package:mvvmwithprovider/components/app_loading.dart';
import 'package:mvvmwithprovider/components/user_list_row.dart';
import 'package:mvvmwithprovider/user_list/models/user_list_model.dart';
import 'package:mvvmwithprovider/user_list/viewmodels/user_viewmodel.dart';
import 'package:mvvmwithprovider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Users"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return AppLoading();
    }
    if (userViewModel.userError == null) {
      return AppError(
        errorText: userViewModel.userError.toString(),
      );
    }
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        UserModels userModels = userViewModel.userListModel[index];
        return UserListRow(
          userModels: userModels,
          onTap: () async {
            userViewModel.setSelectedUser(userModels);
            openUserDetails(context);
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.amber,
      ),
      itemCount: userViewModel.userListModel.length,
    ));
  }
}
