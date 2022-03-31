class UserModel {
  String? userId;
  String? userName;
  String? userType;
  List<dynamic>? userCategories;
  String? state;
  String? city;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userType,
    required this.userCategories,
    required this.state,
    required this.city,
  });
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'userType': userType,
        'userCategories': userCategories,
        'state': state,
        'city': city,
      };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      userType: json['userType'],
      userCategories: json['userCategories'],
      state: json['state'],
      city: json['city'],
    );
  }
}
