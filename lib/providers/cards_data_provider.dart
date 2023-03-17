import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:magic_test/utils/constants.dart';

class MagicProvider {
  /// Function to load card magic data by [page]
  Future<Response> loadCardData(int page) async {
    return await http.get(Uri.parse('$httpPettionData$page'));
  }
}
