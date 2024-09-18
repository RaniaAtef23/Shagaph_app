import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/features/More/data/drink_provider.dart';
import 'core/utils/app_router.dart';
import 'features/Category/presentation/Manger/Birthday/birthday_cubit.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DrinkProvider(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BirthdayCubit>(create: (_) => BirthdayCubit()), // Provide BirthdayCubit
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router, // Use GoRouter for routing
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: Colors.white, // Set default background to white
              colorScheme: ColorScheme.fromSwatch().copyWith(
                background: Colors.white, // Ensure background color is white
              ),
            ),
          ),
        );
      },
    );
  }
}
