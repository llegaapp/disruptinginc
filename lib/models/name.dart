import 'package:alubian/models/main.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class Name extends BaseModel {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) {
    return _$NameFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
Name _$NameFromJson(Map<String, dynamic> json) => Name(
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
);
