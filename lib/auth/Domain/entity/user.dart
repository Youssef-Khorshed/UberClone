// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? password;
  String? image;
  String? token;
  UserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.password,
    required this.image,
    required this.token,
  });

  UserData copyWith({
    String? name,
    String? phone,
    String? email,
    int? id,
    String? password,
    String? image,
    String? token,
  }) {
    return UserData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        id,
        password,
        image,
        token,
      ];
}
