// import 'dart:io';

// import 'package:ev_charging_dashboard/constants.dart';
// import 'package:ev_charging_dashboard/core/services/storage_service.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:path/path.dart' as b;

// class SupabaseStorageService implements StorageService {
//   static late Supabase supabase;
//   static createBucket(String bucketName) async {
//     var buckets = await supabase.client.storage.listBuckets();
//     bool isBucketExist = false;
//     for (var bucket in buckets) {
//       if (bucket.name == bucketName) {
//         isBucketExist = true;
//         break;
//       }
//     }
//     if (!isBucketExist) {
//       await supabase.client.storage.createBucket(bucketName);
//     }
//   }

//   static initSupabase() async {
//     supabase =
//         await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseAnonKey);
//   }

//   @override
//   Future<String> uploadFile(File file, String path) async {
//     String fileName = b.basename(file.path);
//     String extensionName = b.extension(file.path);
//     var result = await supabase.client.storage
//         .from('station_images')
//         .upload('$path/$fileName.$extensionName', file);

//     final String publicUrl = supabase.client.storage
//         .from('station_images')
//         .getPublicUrl('$path/$fileName.$extensionName');

//     return result;
//   }
// }
