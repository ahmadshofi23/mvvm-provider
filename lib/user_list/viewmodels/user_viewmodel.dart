import 'package:flutter/cupertino.dart';
import 'package:mvvmwithprovider/user_list/models/user_error.dart';
import 'package:mvvmwithprovider/user_list/models/user_list_model.dart';
import 'package:mvvmwithprovider/user_list/service/api_status.dart';
import 'package:mvvmwithprovider/user_list/service/user_service.dart';

class UserViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<UserModels> _userListModel = [];
  UserError _userError = UserError();
  late UserModels _selectedUser;
  UserModels _addUser = UserModels();

  bool get loading => _isLoading;
  List<UserModels> get userListModel => _userListModel;
  UserError get userError => _userError;
  UserModels get selectedUser => _selectedUser;
  UserModels get addUser => _addUser;

  UserViewModel() {
    getUser();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModels> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModels userModels) {
    _selectedUser = userModels;
  }

  //tambah data user
  addUsers() async {
    if (!isvalid()) {
      return;
    }
    _userListModel.add(addUser);
    _addUser = UserModels();
    notifyListeners();
    return true;
  }

  //validasi user inputan
  isvalid() {
    if (addUser.name == null || addUser.name!.isEmpty) {
      return false;
    }
    if (addUser.email == null || addUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  //menampilkan data user
  getUser() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModels>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code!.toInt(),
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
