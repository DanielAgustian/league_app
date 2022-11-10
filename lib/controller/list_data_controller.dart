import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:league_app/model/team_model.dart';

import '../api/team_api.dart';

class ListTeamController extends GetxController {
  TeamApi api = TeamApi();
  List<Teams> allTeams = [];
  RxBool loading = true.obs;

  void refreshData() {
    getData();
  }

  Future<List<Teams>?> getData() async {
    loading(true);
    var res = await api.getListTeam('English Premier League');
    loading(false);
    if (res is ListTeam) {
      return res.teams;
    } else {
      return null;
    }
  }

  // List<Teams> getPage(int page) {
  //   // ignore: prefer_is_empty
  //   int lastIndex = (page * 5) - 1;
  //   int firstIndex = (page - 1) * 5;
  //   if (lastIndex > allTeams.length - 1) {
  //     lastIndex = allTeams.length;
  //   }
  //   List<Teams> temp = [];
  //   for (var i = firstIndex; i <= lastIndex; i++) {
  //     temp.add(allTeams[i]);
  //   }

  //   return temp;
  // }
}
