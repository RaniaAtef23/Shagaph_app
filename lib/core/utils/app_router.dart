import 'package:go_router/go_router.dart';

import 'package:shaghaf/features/Category/presentation/views/membership_screen.dart';
import 'package:shaghaf/features/Home/presentation/views/HomeScreen.dart';
import 'package:shaghaf/features/More/presentation/views/SettingScreen.dart';
import 'package:shaghaf/features/More/presentation/views/order_screen.dart';
import 'package:shaghaf/features/Splash/presentation/Views/Screens/splash_Screen.dart';
import 'package:shaghaf/features/auth/presentation/views/LoginScreen.dart';
import 'package:shaghaf/features/auth/presentation/views/SignUp.dart';
import 'package:shaghaf/features/auth/presentation/views/Forget_password_screen.dart';
import 'package:shaghaf/features/auth/presentation/views/verify_password_screen.dart';
import 'package:shaghaf/features/Splash/presentation/Views/Screens/onboarding_screen.dart';
import 'package:shaghaf/features/booking/presentstion/widgets/booking_review_widget.dart';
import 'package:shaghaf/features/events/presentation/views/events_screen.dart';
import 'package:shaghaf/features/offers/presentation/views/offers_screen.dart';
import '../../features/Category/presentation/views/BirthdayScreen.dart';
import '../../features/Category/presentation/views/PhotoSessionScreen.dart';
import '../../features/Home/presentation/views/MainSCREEN.dart';
import '../../features/More/presentation/views/ContactUsScreen.dart';
import '../../features/More/presentation/views/NotificationScreen.dart';

import '../../features/More/presentation/views/ProfileScreen.dart';
import '../../features/Rooms/prsentation/views/RoomInfoScreen.dart';
import '../../features/Rooms/prsentation/views/calendar_view.dart';
import '../../features/Rooms/prsentation/views/main_room_screen.dart';
import '../../features/Rooms/prsentation/views/widgets/calender_widget.dart';
import '../../features/booking/presentstion/views/book_history_screen.dart';
import '../../features/booking/presentstion/views/booking_review_screen.dart';
import '../../features/events/presentation/views/details_screen.dart';

abstract class AppRouter {
  // Route names for easy reference
  static const kSplashScreen = '/';
  static const kOnboardingScreen = '/onboarding';
  static const kMainScreen = '/main';
  static const kLoginScreen = '/login';
  static const kSignUpScreen = '/signup';
  static const kForgotPasswordScreen = '/forgot-password';
  static const kVerifyPasswordScreen = '/verify-password';
  static const kOffersScreen = '/offers';
  static const kEventsScreen = '/events';
  static const kDetailsScreen = '/details';
  static const kContactUsScreen = '/contact-us';
  static const kProfileScreen = '/profile';
  static const kOrdersScreen = '/order';
  static const kNotificationScreen = '/notification';
  static const kBirthdayScreen = '/birthday';
  static const kPhotoSessionScreen = '/photo';
  static const kMembershipScreen = '/membership';
  static const kRoomScreen = '/rooms';
  static const kRoominfoScreen = '/roomsinfo';
  static const kTime = '/time';
  static const kSetting = '/setting';
  static const kBookingreview = '/bookingreview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashScreen,
        // builder: (context, state) => const SplashScreen(),
         builder: (context, state) => MainScreen(),
        // builder: (context, state) =>  RoomInfoScreen(),
        // builder: (context, state) =>  PhotoSessionScreen(),
        //builder: (context, state) =>  OrderScreen(),
        //builder: (context,state)=>MembershipScreen()
        // builder: (context, state) =>  SettingScreen(),
        // builder: (context, state) =>  EventsScreen(),
        //builder: (context, state) =>  booking_review_screen(),
        // builder: (context, state) =>  CalendarView(),
        // builder: (context, state) =>  CalendarView(),
        // builder:(context,state) => OffersGridPage()
      ),
      GoRoute(
        path: kOnboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: kMainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kForgotPasswordScreen,
        builder: (context, state) => const Forget_password_screen(),
      ),
      GoRoute(
        path: kVerifyPasswordScreen,
        builder: (context, state) => const Verify_password_screen(),
      ),
      GoRoute(
        path: kOffersScreen,
        builder: (context, state) => const OffersGridPage(),
      ),
      GoRoute(
        path: kEventsScreen,
        builder: (context, state) => const EventsScreen(),
      ),
      GoRoute(
        path: kDetailsScreen,
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: kContactUsScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: kProfileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: kOrdersScreen,
        builder: (context, state) => const  OrderScreen(),
      ),
      GoRoute(
        path: kNotificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: kBirthdayScreen,
        builder: (context, state) => const BirthdayScreen(),
      ),
      GoRoute(
        path: kPhotoSessionScreen,
        builder: (context, state) => const PhotoSessionScreen(),
      ),
      GoRoute(
        path: kMembershipScreen,
        builder: (context, state) => const MembershipScreen(),
      ),
      GoRoute(
        path: kRoomScreen,
        builder: (context, state) =>  RoomScreen(),
      ),
      GoRoute(
        path: kRoominfoScreen,
        builder: (context, state) => RoomInfoScreen(),
      ),
      GoRoute(
        path: kTime,
        builder: (context, state) => CalendarView(),
      ),
      GoRoute(
        path: kSetting,
        builder: (context, state) => SettingScreen(),
      ),
      GoRoute(
        path: kBookingreview,
        builder: (context, state) => booking_review_screen(),
      ),
    ],
  );
}
