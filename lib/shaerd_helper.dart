import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  SharedHelper._();

  static SharedHelper sHelper = SharedHelper._();

  SharedPreferences sharedPreferences;

  Future<SharedPreferences> initialShared() async {
    if (sharedPreferences == null) {
      return sharedPreferences = await SharedPreferences.getInstance();
    } else {
      return sharedPreferences;
    }
  }

  setValue(bool seen) async {
    sharedPreferences = await initialShared();

    sharedPreferences.setBool('seen', seen);
  }

  Future<bool> getValue() async {
    sharedPreferences = await initialShared();

    bool seen = sharedPreferences.getBool('seen');
    return seen;
  }

  setInformationUser(
      String name, String email, String gender, String birthday) async {
    sharedPreferences = await initialShared();

    List<String> listInformation = [name, email, gender, birthday];
    sharedPreferences.setStringList('listInformation', listInformation);
  }

  Future<List<String>> getInformationUser() async {
    sharedPreferences = await initialShared();

    List<String> listInformation =
        sharedPreferences.getStringList('listInformation');

    return listInformation;
  }
}
