
import '../../../../domain/Entities/SignUpEntity.dart';

/// message : "User registered successfully!"
/// error : "Phone number already registered"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE3NDE1MjIxOTJ9.WCJxKRbX5sab-PqytbjKlrRIcd_hsMu9ptnfjnP2USg"

class SignUpResponse {
  SignUpResponse({
      this.message, 
      this.error, 
      this.token,});

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    token = json['token'];
  }
  String? message;
  String? error;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['token'] = token;
    return map;
  }
  SignUpEntity toSignUpEntity(){
    return SignUpEntity(
      token: token
    );
  }

}