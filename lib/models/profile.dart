import 'package:alubian/models/main.dart';
import 'package:alubian/models/name.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class ProfileModel extends BaseModel {
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  ProfileModel(
      {
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});
  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(

      id: json['id'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      iV: json['iV'] as int?,
    );
