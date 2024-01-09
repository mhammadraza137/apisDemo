class UserModel {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String website;
  final String companyName;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.website,
      required this.companyName});

  factory UserModel.fromJson({required Map<String, dynamic> map}) {
    return UserModel(
        id: map["id"],
        name: map["name"],
        email: map['email'],
        phone: map["phone"],
        address: "${map["address"]["street"]}, ${map["address"]["city"]}",
        website: map["website"],
        companyName: map["company"]["name"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "website": website,
      "company": {"name": companyName}
    };
  }

  UserModel copyWith(
      {int? id,
      String? name,
      String? email,
      String? phone,
      String? address,
      String? website,
      String? companyName}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        website: website ?? this.website,
        companyName: companyName ?? this.companyName);
  }
}
