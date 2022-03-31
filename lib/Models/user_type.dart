class UserType {
  String titile;
  UserType({required this.titile});

  static List<UserType> userTypes = [
    UserType(titile: "Hire a Worker"),
    UserType(titile: "Find a Job")
  ];
}
