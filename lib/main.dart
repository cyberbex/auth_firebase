import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main()  {
 /*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;
  String email = 'gamba@gmail.com';
  String senha = 'gamba88';
 */
  //criar usuário
  /* auth
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print('novo usuário cadastrado com sucesso $firebaseUser.user.email');
  }).catchError((erro) {
    print("novo usuario erro $erro");
  }); */

  //deslogar usuário
  //auth.signOut();

//saber se o usuário está logado ou não
  /*  User? usuarioAtual = auth.currentUser;
  if (usuarioAtual != null) {
    print("Usuário atual logado email: $usuarioAtual.email");
  } else {
    print("usuário está deslogado");
  } */

/*   auth
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print('Logar usuário sucesso!! email:${firebaseUser.user?.email}');
  }).catchError((erro) {
    print('Logar usuário error $erro');
  }); */

  runApp(const MaterialApp(
    home: Home(),
  ));
}
