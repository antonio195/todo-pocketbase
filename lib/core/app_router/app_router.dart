import 'package:auto_route/auto_route.dart';
import 'package:todo_pocketbase/core/app_router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: "/login",
          initial: true,
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: "/register",
          initial: false,
        ),
      ];
}
