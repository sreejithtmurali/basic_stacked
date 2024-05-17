import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedajeesh/Ui/Userlistpage/userlistViewModel.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Userlistviewmodel>.reactive(
      onViewModelReady: (model){
        model.Fetch();
      },
      viewModelBuilder: () {
        return Userlistviewmodel();
      },
      builder:
          (BuildContext context, Userlistviewmodel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(),
          body: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: viewModel.userlist.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            viewModel.userlist[index].firstname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(viewModel.userlist[index].lastname,
                              style: const TextStyle(color: Colors.white)),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(viewModel.userlist[index].avatar),
                          ),
                        ),
                      ),
                    );
                  }),
        );
      },
    );
  }
}
