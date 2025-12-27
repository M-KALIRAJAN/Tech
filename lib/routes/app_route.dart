
import 'package:go_router/go_router.dart';
import 'package:tech_app/routes/route_name.dart';
import 'package:tech_app/view/auth/login_view.dart';
import 'package:tech_app/view/bottom_nav.dart';

final Approute = GoRouter(
  initialLocation: RouteName.login,
  routes: [
    GoRoute(
      path: RouteName.login,
      builder: (context, state) => LoginView()
      ),
      GoRoute(
        path: RouteName.bottom_nav,
        builder: (context, state) =>  BottomNav(),
        )

  ]);