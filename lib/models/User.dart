// ignore: file_names
class User {
  final String name;
  final String email;
  final String password;

  User({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  Future<String> playerteam(String name) async {
    final url = User(name: name);
    final response = await url.playerteam(name);
    return response;
  }
}
