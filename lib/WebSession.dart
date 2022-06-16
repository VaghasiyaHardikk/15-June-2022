// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unrelated_type_equality_checks, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures, await_only_futures

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:school_lite_10th_june/Dataprotection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';


Future<Object> WebSession() async {
  
  final sharedPreferences = await SharedPreferences.getInstance();
  var AppUserHashShared = await sharedPreferences.get("AppUserHash");
  var AppUserId =  DataProtection.decryptAES(AppUserHashShared);
  var AppUserEmail = await sharedPreferences.get("Email");
  var AppUserName = await sharedPreferences.get("UserName");


  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (ConnectivityResult == ConnectivityResult.mobile) {
      if (String != (AppUserId) || String != (AppUserEmail) ||String != (AppUserName)) 
      {
        //datetime
        DateTime indianTime = DateTime.now().toUtc();
        DateFormat dateFormat = DateFormat("yyyy/MM/dd HH:mm:ss");
        String string = dateFormat.format(DateTime.now());

        // var token = AppUserId + "~" + AppUserEmail + "~" + AppUserName + "~" + DateFormat + "~" + DeviceInfoPlugin + "schoolDesk";
        var token = AppUserId + "~" + AppUserEmail + "~" + AppUserName + "~" + dateFormat + "~" ;
        var tokenEncrypt = DataProtection.encryptAES(token);

        {
          var HomeWebViewURL = Uri.parse("https://test.rbkei.org/Mobile/Toweb?token=" + tokenEncrypt);
          var urlStatus = HomeWebViewURL;
          {
            return HomeWebViewURL;
          }
          
        }
          }
    else{
      SnackBarAction(label: "In correct page source. Please contact school authorities.", onPressed: () {  },);
    }
      {

      }
    } 
  } catch (SD402) {
    print("SD402");
  }
  return "";
}
