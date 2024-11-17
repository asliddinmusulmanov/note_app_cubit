import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:note_app_cubit/feature/home/data/model/todo.dart';

class NetworkServices {
  static Dio dio = Dio();

  static const String contactsApi = "https://jsonplaceholder.typicode.com/todos";

  static Future<void> getContacts() async {
    try {
      final result = await dio.get(contactsApi);

      if (result.statusCode == 200 || result.statusCode == 201) {
        // contactsModelList = (result.data as List).map((e) => ContactsModel.fromJson(e)).toList();
        // debugPrint(contactsModelList.toString());
      }
    } catch (e) {
      print('Error fetching contacts: $e');
    }
  }

  static Future<void> postContacts(Todo data) async {
    final natija = await dio.post(contactsApi, data: data.toJson());
  }

  static Future<void> deleteContacts(String id) async {
    final natija1 = await dio.delete(
      "$contactsApi/$id",
    );
  }

  static Future<void> updateContacts(Todo data, String id) async {
    final natija2 = await dio.put("$contactsApi/$id", data: data.toJson());
    try {
      if (natija2.statusCode == 200 || natija2.statusCode == 201) {
        // Assuming the response data is a list of contacts
        debugPrint(natija2.statusCode.toString());
      }
    } catch (e) {
      print('Error fetching contacts: $e');
    }
  }
}
