import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharsa_app/features/order/presentation/screens/new_order_screen.dart';
import '../../features/best_seller/presentation/screens/best_seller_screen.dart';
import '../../features/category/presentation/screens/category_screen.dart';
import '../../features/details/presentation/screens/details_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/login/manager/login_cubit.dart';
import '../../features/login/presentation/screens/before_login_screen.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/profile/presentation/screens/user_account_screen.dart';
import '../../features/signup/manager/signup_cubit.dart';
import '../../features/signup/presentation/screens/signup_screen.dart';
import '../di/dependency_injection.dart';
import '../widgets/about_us_screen.dart';
import '../widgets/notifications_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Onboarding Screen
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      // Before Login Screens
      case Routes.beforeLoginScreen:
        return MaterialPageRoute(builder: (_) => const BeforeLoginScreen());

      // Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

      // Signup Screen
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );

      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // Best Seller Screen
      case Routes.bestSellerScreen:
        return MaterialPageRoute(builder: (_) => const BestSellerScreen());

      // Notifications Screen
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      // Details Screen
      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());

      // About Us Screen
      case Routes.aboutUsScreen:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      // User Account Screen
      case Routes.userAccountScreen:
        return MaterialPageRoute(builder: (_) => const UserAccountScreen());

      // Category Screen
      case Routes.categoryScreen:
        return MaterialPageRoute(builder: (_) => CategoryScreen());

      // New Order Screen
      case Routes.newOrderScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => NewOrderScreen(
                productName: args?['productName'],
                productImage: args?['productImage'],
                productPrice: args?['productPrice'],
                productId: args?['productId'],
              ),
        );

      default:
        return null;
    }
  }
}
