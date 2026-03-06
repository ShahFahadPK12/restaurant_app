import "package:flutter/material.dart";

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String token;
  final String language;
  final String? image;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    required this.language,
    required this.token,
    required this.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['user']["id"],  
      fullName: json['user']['fullName'], 
      email: json['user']['email'], 
      phoneNumber: json['user']['phoneNumber'], 
      language: json['user']['language'], 
      token: json['jwt'], 
      image: json['user']['image']?['url'],
      );
  }
}