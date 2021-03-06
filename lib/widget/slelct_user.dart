// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/style.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print('screen = $screen');
    return Scaffold(
        floatingActionButton: Logout(),
        appBar: AppBar(
          title: const Text(
            'Select User',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[MyStyle().lightColor, MyStyle().primaryColor],
              ),
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selectuser(),
          ],
        )));
  }

  TextButton Logout() => TextButton(
      onPressed: () async {
        await Firebase.initializeApp().then((value) async {
          await FirebaseAuth.instance.signOut().then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, '/authen', (route) => false));
        });
      },
      child: const Text('ออกจากระบบ'),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ));

  SizedBox Selectuser() {
    return SizedBox(
      width: screen * 0.65,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('chakkarin eammi'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().aColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
