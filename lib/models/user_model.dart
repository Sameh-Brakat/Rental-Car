
class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? image;
  String? bio;
  UserModel({
     this.name,
     this.phone,
     this.email,
     this.uId,
     this.image,
     this.bio,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'bio': bio,
      'image': image,
    };
  }
}
