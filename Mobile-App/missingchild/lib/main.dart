import 'package:ai_safetrack/core/api/apiservice.dart';
import 'package:ai_safetrack/core/api/storagetoken.dart';
import 'package:ai_safetrack/features/about/screens/about_screen.dart';
import 'package:ai_safetrack/features/auth/cubit/logincubit/cubit/login_cubit.dart';
import 'package:ai_safetrack/features/auth/cubit/registercubit/cubit/register_cubit.dart';
import 'package:ai_safetrack/features/auth/repository/loginrequest.dart';
import 'package:ai_safetrack/features/auth/repository/registerrequest.dart';
import 'package:ai_safetrack/features/auth/screens/login.dart';
import 'package:ai_safetrack/features/auth/screens/otpVerification.dart';
import 'package:ai_safetrack/features/auth/screens/otpforget.dart';
import 'package:ai_safetrack/features/auth/screens/register.dart';
import 'package:ai_safetrack/features/auth/screens/resetpass.dart';
import 'package:ai_safetrack/features/auth/screens/updatepass.dart';
import 'package:ai_safetrack/features/comment/screen/commentpage.dart';
import 'package:ai_safetrack/features/feedback/screens/feedback.dart';
import 'package:ai_safetrack/features/feedback/screens/rate.dart';
import 'package:ai_safetrack/features/home/screen/home.dart';
import 'package:ai_safetrack/features/loading/screen/loadingpage.dart';
import 'package:ai_safetrack/features/map/screens/showmap.dart';
import 'package:ai_safetrack/features/notification/screens/notification.dart';
import 'package:ai_safetrack/features/profile/screens/editprofile.dart';
import 'package:ai_safetrack/features/profile/screens/profile.dart';
import 'package:ai_safetrack/features/publish/screens/publish.dart';
import 'package:ai_safetrack/features/reports/screens/accident.dart';
import 'package:ai_safetrack/features/reports/screens/found.dart';
import 'package:ai_safetrack/features/reports/screens/missing.dart';
import 'package:ai_safetrack/features/userprofile/screen/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiService = ApiService();

  final token = await TokenStorage.getToken();
  final hasToken = token != null && token.isNotEmpty;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(Loginrequest(apiService)),
        ),
        BlocProvider<RegisterCubit>(
          create: (_) => RegisterCubit(Registerrequest(apiService)),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MyApp(hasToken: hasToken);
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasToken;

  const MyApp({super.key, required this.hasToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        'map': (context) => Showmap(),
        'publish': (context) => Publish(),
        'home': (context) => Home(),
        'profile': (context) => Profile(),
        'notification': (context) => Notificationpage(),
        'missing': (context) => Missing(),
        'found': (context) => Found(),
        'load': (context) => WelcomeScreen(),
        'editprofile': (context) => Editprofile(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'reset': (context) => Resetpass(),
        'accident': (context) => Accident(),
        'feedback': (context) => FeedbackPage(),
        'rate': (context) => RatePage(),
        'about': (context) => AboutPage(),
        'comment': (context) => Commentpage(),
        'otpVerification': (context) => Otpverification(),
        'otpforgetpass': (context) => Otpforgetpass(),
        'updatepass': (context) => UpdatePasswordScreen(),
        'userprofile': (context) => Userprofile(),
      },

      home: hasToken ? const Home() : WelcomeScreen(),
    );
  }
}
