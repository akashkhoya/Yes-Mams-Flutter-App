import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass{

  Future<void> setloginstatus(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login_status',status);
  }
  Future<String>getloginstatus() async {
    SharedPreferences getloginprefs = await SharedPreferences.getInstance();
     return getloginprefs.getString('login_status');
  }

  Future<void> setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('email',email);
  }
  Future<String>getEmail() async {
    SharedPreferences getloginprefs = await SharedPreferences.getInstance();
    return getloginprefs.getString('email');
  }

  Future<void> setName(String name) async {
    SharedPreferences nameprefs = await SharedPreferences.getInstance();
    nameprefs.setString('name',name);
  }
  Future<String>getName() async {
    SharedPreferences getnameprefs = await SharedPreferences.getInstance();
    return getnameprefs.getString('name');
  }
  Future<void> setUserName(String username) async {
    SharedPreferences nameprefs = await SharedPreferences.getInstance();
    nameprefs.setString('username',username);
  }
  Future<String>getUserName() async {
    SharedPreferences getnameprefs = await SharedPreferences.getInstance();
    return getnameprefs.getString('username');
  }
  Future<void> setjoinedat(String joinedat) async {
    SharedPreferences nameprefs = await SharedPreferences.getInstance();
    nameprefs.setString('joinedat',joinedat);
  }
  Future<String>getjoinedat() async {
    SharedPreferences getnameprefs = await SharedPreferences.getInstance();
    return getnameprefs.getString('joinedat');
  }

  Future<void> settoken(String token) async {
    SharedPreferences tokenprefs = await SharedPreferences.getInstance();
    tokenprefs.setString('token',token);
  }
  Future<String>gettoken() async {
    SharedPreferences gettokenprefs = await SharedPreferences.getInstance();
    return gettokenprefs.getString('token');
  }





}