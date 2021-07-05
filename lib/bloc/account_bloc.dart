import 'dart:async';

import 'package:slark/api/account.dart';

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

  Future registerAcc(userData) async {
    print("In register bloc");

    API_Account_Provider apiProv = new API_Account_Provider();
    var accountData;
    await apiProv.register(userData).then((value) {
      accountData = value;
    });
    print('out of Bloc');
    return accountData;
  }

  Future loginAcc(userData) async {
    print("In login bloc");

    API_Account_Provider apiProv = new API_Account_Provider();
    var accountData;
    try {
      await apiProv.login(userData).then((value) {
        accountData = value;
      });
    } catch (e) {
      print('Error' + e.toString());
    }

    print('out of Bloc');
    return accountData;
  }

  Future<AccountRegister> verifyAcc(email) async {
    AccountRegister verifyData;
    API_Account_Provider apiProv = new API_Account_Provider();
    await apiProv.verify(email).then((value) {
      verifyData = value;
    });
    print('out of Bloc');
    return verifyData;
  }

  Future deleteAcc(userid) async {
    var deletionData;
    API_Account_Provider apiProv = new API_Account_Provider();
    await apiProv.deleteAcc(userid).then((value) {
      deletionData = value;
    });
    print('out of Bloc');
    return deletionData;
  }

  void dispose() {
    _accountStateController.close();
    _accountEventController.close();
  }
}
