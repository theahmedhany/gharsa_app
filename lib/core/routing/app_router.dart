import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helpers/constants.dart';
import '../../features/best_seller/data/repos/best_seller_products_repo.dart';
import '../../features/best_seller/manager/best_seller_products_cubit.dart';
import '../../features/category/data/repos/all_categories_repo.dart';
import '../../features/category/data/repos/category_products_repo.dart';
import '../../features/category/manager/all_categories/all_categories_cubit.dart';
import '../../features/category/manager/category_products/category_products_cubit.dart';
import '../../features/category/presentation/screens/category_products_list.dart';
import '../../features/details/data/repos/product_details_repo.dart';
import '../../features/details/manager/product_details_cubit.dart';
import '../../features/order/data/repos/new_order_repo.dart';
import '../../features/order/manager/new_order_cubit.dart';
import '../../features/order/presentation/screens/new_order_screen.dart';
import '../../features/search/data/repos/search_products_repo.dart';
import '../../features/search/manager/search_products_cubit.dart';
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
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => BestSellerProductsCubit(
                          getIt<BestSellerProductsRepo>(),
                        )..emitGetAllProducts(),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            SearchProductsCubit(getIt<SearchProductsRepo>())
                              ..getProductsBySearch(
                                searchedProduct: filterProductsBySearch,
                              ),
                  ),
                ],
                child: const HomeScreen(),
              ),
        );

      // Best Seller Screen
      case Routes.bestSellerScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        BestSellerProductsCubit(getIt<BestSellerProductsRepo>())
                          ..emitGetAllProducts(),
                child: const BestSellerScreen(),
              ),
        );

      // Notifications Screen
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      // Details Screen
      case Routes.detailsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ProductDetailsCubit(getIt<ProductDetailsRepo>())
                          ..emitGetProductDetails(args?['productId']),
                child: const DetailsScreen(),
              ),
        );

      // About Us Screen
      case Routes.aboutUsScreen:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      // User Account Screen
      case Routes.userAccountScreen:
        return MaterialPageRoute(builder: (_) => const UserAccountScreen());

      // Category Screen
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        AllCategoriesCubit(getIt<AllCategoriesRepo>())
                          ..emitGetAllCategories(),
                child: CategoryScreen(),
              ),
        );

      // Category Products Screen
      case Routes.categoryProductsList:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        CategoryProductsCubit(getIt<CategoryProductsRepo>()),
                child: CategoryProductsList(
                  categoryId: args?['categoryId'] ?? 0,
                  categoryName: args?['categoryName'] ?? '',
                ),
              ),
        );

      // New Order Screen
      case Routes.newOrderScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        NewOrderCubit(getIt<NewOrderRepo>())
                          ..emitNewOrder(args?['productId']),
                child: NewOrderScreen(
                  productName: args?['productName'],
                  productImage: args?['productImage'],
                  productPrice: args?['productPrice'],
                  productId: args?['productId'],
                ),
              ),
        );

      default:
        return null;
    }
  }
}
