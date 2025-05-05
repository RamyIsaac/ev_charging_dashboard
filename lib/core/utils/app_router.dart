import 'package:ev_charging_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:ev_charging_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kDashboard = '/';
  static const kAddProductView = '/AddProductView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kDashboard,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: kAddProductView,
        builder: (context, state) => const AddProductView(),
      ),
    ],
  );
}
