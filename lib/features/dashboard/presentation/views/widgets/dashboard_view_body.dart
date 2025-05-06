import 'package:ev_charging_dashboard/core/utils/app_router.dart';
import 'package:ev_charging_dashboard/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAddProductView);
            },
            text: 'add data',
          ),
        ],
      ),
    );
  }
}
