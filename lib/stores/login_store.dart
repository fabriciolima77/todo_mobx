import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  //sempre que houver alguma alteração nos observables o autorun é executado
  /*_LoginStore(){
    autorun((_){
      print(email);
      print(password);
    });
  }*/

  @observable
  String email ="";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> login() async {
    loading = true;

    //simulando processamento de login
    await Future.delayed(Duration(seconds: 2));
    //processar

    loading = false;
    loggedIn = true;
  }

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  @computed
  bool get isEmailValid => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  //sempre que usar um @computed declarar um get
  @computed
  bool get isPasswordValid => password.length > 6;


}