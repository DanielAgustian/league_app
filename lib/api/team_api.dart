import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:league_app/model/team_model.dart';

class TeamApi {
  Future<ListTeam?> getListTeam(String league) async {
    Dio dio = Dio();

    try {
      var response = await dio.get(
          'https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League',
          queryParameters: {'l': league});
      ListTeam cal = ListTeam.fromJson(response.data);

      print(response.data);

      return cal;
    } on DioError catch (e) {
      if (kDebugMode) {
        print('Error:$e');
      }

      // ignore: newline-before-return
      return null;
    }
  }
}
