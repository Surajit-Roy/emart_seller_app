import 'package:emart_seller/const/firebase_const.dart';
import 'package:emart_seller/const/strings.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    checkuser();
  }
  var isloggedIn = false;
  checkuser()async{
    auth.authStateChanges().listen((User ? user) { 
      if(user == null && mounted){
        isloggedIn = false;
      }else{
        isloggedIn = true;
      }
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home:isloggedIn? const Home(): const LoginScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0),
      ),
    );
  }
}
