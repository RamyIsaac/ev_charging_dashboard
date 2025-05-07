import 'package:bloc/bloc.dart';
import 'package:ev_charging_dashboard/constants.dart';
import 'package:ev_charging_dashboard/core/services/get_it_service.dart';
import 'package:ev_charging_dashboard/core/services/supabase_storage_service.dart';
import 'package:ev_charging_dashboard/core/utils/app_router.dart';
import 'package:ev_charging_dashboard/core/utils/custom_bloc_observer.dart';
import 'package:ev_charging_dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SupabaseStorageService.initSupabase();
  //await SupabaseStorageService.createBucket('station_images');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
