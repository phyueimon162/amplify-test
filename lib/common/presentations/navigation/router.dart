import 'package:flutter/cupertino.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:amplify/features/authentication/presentations/sign_in/sign_in_page.dart';
import 'package:amplify/features/authentication/presentations/sign_up/sign_up_page.dart';
import 'package:amplify/features/authentication/presentations/welcome/welcome_page.dart';
import 'package:amplify/features/book/presentations/books/books_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (_) => getPage(settings),
    );
  }

  static Widget getPage(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcomePage:
        return const WelcomePage();
      case AppRoutes.signInPage:
        return const SignInPage();
      case AppRoutes.signUpPage:
        return const SignUpPage();
      case AppRoutes.booksPage:
        return const BooksPage();
      default:
        return const WelcomePage();
    }
  }
}
