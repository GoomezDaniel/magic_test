import 'dart:convert';
import 'dart:math';

import 'package:magic_test/models/magic_data_model.dart';

import 'package:http/http.dart' as http;
import 'package:magic_test/utils/constants.dart';

class MagicProvider {
  Future<MagicDataModel> loadCardData(int page) async {
    final response = await http.get(Uri.parse('$httpPettionData$page'));

    return MagicDataModel.fromJson(jsonDecode(response.body));
  }
}
