class User {
  final String login;
  final String email;

  User(this.login, this.email);
}

class AdminUser extends User with MailSystem {
  AdminUser(String login, String email) : super(login, email);
}

class GeneralUser extends User {
  GeneralUser(String login, String email) : super(login, email);

  factory GeneralUser.main() {
    return GeneralUser('mainUser', 'main@mail.ru');
  }
}

mixin MailSystem on User {
  String getMailSystem() => email.substring(email.indexOf('@') + 1);
}

class UserManager<T extends User> {
  List<T> _users = [];

  void addUser(T user) {
    this._users.add(user);
  }

  void deleteUser(T user) {
    this._users.remove(user);
  }

  void printEmail() {
    this._users.forEach((user) {
      print((user is AdminUser) ? user.getMailSystem() : user.email);
    });
  }
}
