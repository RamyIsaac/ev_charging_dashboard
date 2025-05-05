import 'package:ev_charging_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kDashboard = '/';

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: kDashboard,
        builder: (context, state) => const DashboardView(),
      ),
    ],
  );
}
