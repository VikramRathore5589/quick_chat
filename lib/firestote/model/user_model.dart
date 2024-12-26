class UserModel {
  String id;
  String image;
  String about;
  String name;
  String createdAt;
  bool isOnline;
  String lastActive;
  String email;
  String pushToken;

  UserModel({
    required this.id,
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.lastActive,
    required this.email,
    required this.pushToken,
  });

  // Convert a UserModel object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'about': about,
      'name': name,
      'createdAt': createdAt,
      'isOnline': isOnline,
      'lastActive': lastActive,
      'email': email,
      'pushToken': pushToken,
    };
  }

  // Create a UserModel object from a JSON map (Static method)
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      about: json['about'] ?? '',
      name: json['name'] ?? '',
      createdAt: json['createdAt'] ?? '',
      isOnline: json['isOnline'] ?? false,
      lastActive: json['lastActive'] ?? '',
      email: json['email'] ?? '',
      pushToken: json['pushToken'] ?? '',
    );
  }
}
