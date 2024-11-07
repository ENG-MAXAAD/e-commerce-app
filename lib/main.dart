import 'package:flutter/material.dart';
import 'package:myapp_ecommerce/screens/AddCardScreen.dart';
import 'package:myapp_ecommerce/screens/ChatAssistantScreen.dart';
import 'package:myapp_ecommerce/screens/ChatScreen.dart';
import 'package:myapp_ecommerce/screens/HelpSupportScreen.dart';
import 'package:myapp_ecommerce/screens/IncomingCallScreen.dart';
import 'package:myapp_ecommerce/screens/LanguageSelectionScreen.dart';
import 'package:myapp_ecommerce/screens/MyCardsScreen.dart';
import 'package:myapp_ecommerce/screens/NotificationScreen.dart';
import 'package:myapp_ecommerce/screens/NotificationSettingsScreen.dart';
import 'package:myapp_ecommerce/screens/RatingAndReviewScreen.dart';
import 'package:myapp_ecommerce/screens/ResetPassword.dart';
import 'package:myapp_ecommerce/screens/SearchResultScreen.dart';
import 'package:myapp_ecommerce/screens/SignUpScreen.dart';
import 'package:myapp_ecommerce/screens/TermsOfServiceScreen.dart';
import 'package:myapp_ecommerce/screens/cartScreen.dart';
import 'package:myapp_ecommerce/screens/changeScreen.dart';
import 'package:myapp_ecommerce/screens/checkoutScreen.dart';
import 'package:myapp_ecommerce/screens/createNewPassword.dart';
import 'package:myapp_ecommerce/screens/editScreen.dart';
import 'package:myapp_ecommerce/screens/filter_search.dart';
import 'package:myapp_ecommerce/screens/home.dart';
import 'package:myapp_ecommerce/screens/login.dart';
import 'package:myapp_ecommerce/screens/onboardingScreen%5D.dart';
import 'package:myapp_ecommerce/screens/otp.dart';
import 'package:myapp_ecommerce/screens/productDetial.dart';
import 'package:myapp_ecommerce/screens/resetPasswordForNumber.dart';
import 'package:myapp_ecommerce/screens/searchScreen.dart';
import 'package:myapp_ecommerce/screens/settungScreen.dart';
import 'package:myapp_ecommerce/screens/splashScreen.dart';
import 'package:myapp_ecommerce/screens/themeScreen.dart';
import 'package:myapp_ecommerce/screens/video_call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
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
      // home: OnboardingScreen(),
      // home: NotificationScreen(),
      // home: ProfileScreen(),
      // home: EditProfileScreen(),
      // home: ChangePasswordScreen(),
      // home: NotificationSettingsScreen(),
      // home: LanguageSelectionScreen(),
      // home: TermsOfServiceScreen(),
      // home: SplashScreen(),
      // home: CartScreen(),
      // home: CheckoutScreen(),
      // home: HelpSupportScreen(),
      // home: ThemeSelectionScreen(),
      // home: MyCardsScreen(),
      // home: AddNewCardScreen(),
      // home: ChatAssistantScreen(),
      // home: ChatScreen(),
      // home: IncomingCallScreen(),
      // home: VideoCallScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
