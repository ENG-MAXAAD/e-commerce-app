import 'package:flutter/material.dart';
import 'package:myapp_ecommerce/screens/RatingAndReviewScreen.dart';
import 'package:myapp_ecommerce/screens/ResetPassword.dart';
import 'package:myapp_ecommerce/screens/SearchResultScreen.dart';
import 'package:myapp_ecommerce/screens/SignUpScreen.dart';
import 'package:myapp_ecommerce/screens/createNewPassword.dart';
import 'package:myapp_ecommerce/screens/filterPopUp.dart';
import 'package:myapp_ecommerce/screens/home.dart';
import 'package:myapp_ecommerce/screens/login.dart';
import 'package:myapp_ecommerce/screens/otp.dart';
import 'package:myapp_ecommerce/screens/productDetial.dart';
import 'package:myapp_ecommerce/screens/resetPasswordForNumber.dart';
import 'package:myapp_ecommerce/screens/searchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginScreen(),
      // home: SignUpScreen(),
      // home: ResetPassword(),
      // home: OtpScreen(),
      // home: CreateNewPassword(),
      // home: ResetPasswordForNum(),
      home: Home(),
      // home: ProductDetailsScreen(),
      // home: SearchScreen(),
      // home: SearchResultScreen(),
      // home: FilterTab(),
      // home: RatingAndReviewsScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
