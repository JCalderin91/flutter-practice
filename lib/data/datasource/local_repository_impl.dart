import 'package:api_rest_app/domain/models/user_model.dart';
import 'package:api_rest_app/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'ACCESS_TOKEN';
const _pref_user_id = 'USER_ID';
const _pref_username = 'USERNAME';
const _pref_user_email = 'USER_EMAIL';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString(_pref_user_id);
    final username = sharedPreferences.getString(_pref_username);
    final userEmail = sharedPreferences.getString(_pref_user_email);

    final user = User(
      id: int.parse(userId),
      email: userEmail,
      name: username,
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_user_id, user.id.toString());
    sharedPreferences.setString(_pref_username, user.name);
    sharedPreferences.setString(_pref_user_email, user.email);
    return user;
  }
}
