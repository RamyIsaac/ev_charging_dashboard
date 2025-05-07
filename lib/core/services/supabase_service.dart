// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'database_service.dart';

// class SupabaseService implements DatabaseService {
//   final SupabaseClient _client = Supabase.instance.client;

//   @override
//   Future<void> addData({
//     required String path,
//     required Map<String, dynamic> data,
//     String? documentId,
//   }) async {
//     final insertData = {
//       ...data,
//       if (documentId != null) 'id': documentId,
//     };

//     final response = await _client.from(path).upsert(insertData);

//     if (response.error != null) {
//       throw Exception('Failed to add data: ${response.error!.message}');
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> getData({
//     required String path,
//     required String documentId,
//   }) async {
//     final response =
//         await _client.from(path).select().eq('id', documentId).single();

//     return response;
//   }

//   @override
//   Future<bool> isDataExist({
//     required String path,
//     required String documentId,
//   }) async {
//     final response = await _client
//         .from(path)
//         .select('id')
//         .eq('id', documentId)
//         .maybeSingle();

//     return response != null;
//   }
// }
