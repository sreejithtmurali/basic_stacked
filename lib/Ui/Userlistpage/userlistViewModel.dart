import 'package:stacked/stacked.dart';
import 'package:stackedajeesh/Services/apiclass.dart';
import 'package:stackedajeesh/model/usermodel.dart';

class Userlistviewmodel extends BaseViewModel{
  List<UserModel> userlist=[];
  ApiServices apiServices=ApiServices();
  Future<void> Fetch() async {
    userlist=await apiServices.getUsers();
    notifyListeners();
  }

}