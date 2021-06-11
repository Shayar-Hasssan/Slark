import 'dart:async';

import 'package:slark/api/account.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/account_register.dart';

class AccountBloc {
  AccountRegister response;
  final _accountStateController = StreamController<AccountRegister>();
  // ignore: unused_element
  StreamSink<AccountRegister> get _inaccount => _accountStateController.sink;
  Stream<AccountRegister> get account => _accountStateController.stream;
  final _accountEventController = StreamController<AccountRegister>();
  Sink<AccountRegister> get counterEventSink => _accountEventController.sink;

  AccountBloc();

  Future<AccountRegister> registerAcc(userData) async {
    print("i am in register bloc");
    print('User Data in Bloc : $userData');
    API_Account_Provider apiProv = new API_Account_Provider();
    AccountRegister accountData;
    await apiProv.register(userData).then((value) {
      print("/////");
      print(value);
      accountData = value;
    });
    return accountData;
  }

  Future<AccountLogin> loginAcc(userData) async {
    print("i am in login bloc");
    print('User Data in Bloc : $userData');
    API_Account_Provider apiProv = new API_Account_Provider();
    AccountLogin accountData;
    await apiProv.login(userData).then((value) {
      print("/////");
      print(value);
      accountData = value;
    });
    return accountData;
  }

  // void verifyAcc(email) async {
  //   API_Account_Provider apiProv = new API_Account_Provider();
  //   await apiProv.verify(email).then((value) {});
  // }

  void dispose() {
    _accountStateController.close();
    _accountEventController.close();
  }
}
