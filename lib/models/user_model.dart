class UserModel {
  String name;
  String university;
  bool isPremium;
  int streak;

  UserModel({
    required this.name,
    required this.university,
    this.isPremium = false,
    this.streak = 1,
  });
}