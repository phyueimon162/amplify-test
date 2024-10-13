import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:amplify/common/presentations/navigation/navigation_service.dart';
import 'package:amplify/common/presentations/navigation/router.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/network/amplify/amplify_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AmplifyService.configureAmplify();
  bool isAuthenticated = await AmplifyService.fetchAuthSession();

  runApp(
    ProviderScope(
      child: MyApp(
        initialRoute:
            isAuthenticated ? AppRoutes.booksPage : AppRoutes.welcomePage,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Amplify",
      theme: AppTheme.of(context).materialThemeData,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      initialRoute: initialRoute,
    );
  }
}
