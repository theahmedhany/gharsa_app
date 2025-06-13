import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/favorite/manager/favorite_cubit.dart';
import 'core/helpers/constants.dart';
import 'core/routing/routes.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'core/widgets/no_internet_connection.dart';
import 'core/routing/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => FavoriteCubit()..loadFavorites(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Cairo'),
            onGenerateRoute: appRouter.generateRoute,
            initialRoute:
                isLoggedInUser ? Routes.homeScreen : Routes.onboardingScreen,
            builder: (context, child) {
              return OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  List<ConnectivityResult> connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      !connectivity.contains(ConnectivityResult.none);

                  if (connected) {
                    return child;
                  } else {
                    return noInternetConnection();
                  }
                },
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
