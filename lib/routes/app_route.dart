
import 'package:go_router/go_router.dart';
import 'package:tech_app/routes/route_name.dart';
import 'package:tech_app/view/auth/login_view.dart';
import 'package:tech_app/view/bottom_nav.dart';
import 'package:tech_app/view/bulk_request.dart';
import 'package:tech_app/view/material_request.dart';
import 'package:tech_app/view/update_request.dart';
import 'package:tech_app/widgets/card/servicerequest_cart.dart';

final Approute = GoRouter(
  initialLocation: RouteName.login,
  routes: [
    GoRoute(
      path: RouteName.login,
      builder: (context, state) =>const LoginView()
      ),
      GoRoute(
        path: RouteName.bottom_nav,
        builder: (context, state) => const BottomNav(),
        ),
        GoRoute(
          path: RouteName.bulk_request,
          builder: (context, state) => const BulkRequest(),
          ),
           GoRoute(
          path: RouteName.material_request,
          builder: (context, state) => const MaterialRequest(),
          ),
          GoRoute(
            path: RouteName.service_card,
            builder: (context, state) => const ServicerequestCart(),
            ),
            GoRoute(
              path: RouteName.updated_status,
              builder: (context, state) => const UpdateRequest(),
              )

  ]);