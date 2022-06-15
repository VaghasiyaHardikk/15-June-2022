// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_new, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school_lite_10th_june/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controller;
  late SharedPreferences logindata;
  String? Data;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      Data = logindata.getString('Data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/schooldesk.png',
            height: 35,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  logindata.setBool('Data', true);
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyLoginPage()));
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 500,
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(38.0),
                          child: Center(
                              child: Text(
                            'fullName - $Data',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1000,
                width: 500,
                color: Colors.white,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      child: WebView(
                        // javascriptMode: JavascriptMode.unrestricted,
                        initialUrl:
                            'https://test.rbkei.org/Employees/GetEmployeeProfile?IsProfile=True',
                        onWebViewCreated: (controller) {
                          this.controller = controller;
                        },
                      ),
                      
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
);
  }
}
