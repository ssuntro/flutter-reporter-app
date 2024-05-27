void main() {
  // late String username;
  // print(username); // This will cause a late initialization error

  print(User().username);
  // print(AppConfigWithError().apiEndpoint);
  AppConfigWithError.a;

//Solution-2
  late String result = _getResult();
  print("result: $result");
}

//Solution-2
String _getResult() {
  return "Ann ja";
}

//Solution-1
class User {
  late String username;

  User() {
    username = 'FlutterDev';
  }
}

//Pitfall-1
class AppConfigWithError {
  late final String apiEndpoint;
  static const a = "";

  void configure(String endpoint) {
    apiEndpoint = endpoint;
  }
}
