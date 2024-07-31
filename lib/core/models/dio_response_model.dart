// To parse this JSON data, do
//
//     final dioResponseModel = dioResponseModelFromJson(jsonString);

import 'dart:convert';

DioResponseModel dioResponseModelFromJson(String str) => DioResponseModel.fromJson(json.decode(str));

String dioResponseModelToJson(DioResponseModel data) => json.encode(data.toJson());

class DioResponseModel {
  DioResponseModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  final int? statusCode;
  final String? message;
  final Errors? errors;

  factory DioResponseModel.fromJson(Map<String, dynamic> json) => DioResponseModel(
        statusCode: json["status_code"],
        message: json["message"],
        errors: json["errors"] == null
            ? null
            : json["errors"].isEmpty
                ? null
                : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "errors": errors?.toJson(),
      };
}

class Errors {
  Errors({
    this.businessId,
    this.roleId,
    this.email,
    this.contactNumber,
    this.name,
    this.firebaseUid,
    this.invalidCredentials,
    this.passwordIsAlreadyReset,
    this.password,
    this.invalidDefaultPassword,
    this.invalidWorkingHours,
    // this.assigneeFutureBookings,
    // this.closeBookingSlotClosed
    // "{"success":false,"message":"Email already registered!"}"
  });

  final List<String>? businessId;
  final List<String>? roleId;
  final List<String>? email;
  final List<String>? contactNumber;
  final List<String>? name;
  final List<String>? firebaseUid;
  final List<String>? invalidCredentials;
  final List<String>? passwordIsAlreadyReset;
  final List<String>? password;
  final List<String>? invalidDefaultPassword;
  final List<String>? invalidWorkingHours;
  // final List<String>? assigneeFutureBookings;
  // final List<String>? closeBookingSlotClosed;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        businessId: json["business_id"] == null ? null : List<String>.from(json["business_id"].map((x) => x)),
        roleId: json["role_id"] == null ? null : List<String>.from(json["role_id"].map((x) => x)),
        email: json["email"] == null ? null : List<String>.from(json["email"].map((x) => x)),
        contactNumber: json["contact_number"] == null ? null : List<String>.from(json["contact_number"].map((x) => x)),
        name: json["name"] == null ? null : List<String>.from(json["name"].map((x) => x)),
        firebaseUid: json["firebase_uid"] == null ? null : List<String>.from(json["firebase_uid"].map((x) => x)),
        invalidCredentials: json["invalid_credintials"] == null ? null : List<String>.from(json["invalid_credintials"].map((x) => x)),
        passwordIsAlreadyReset:
            json["password_is_already_reset"] == null ? null : List<String>.from(json["password_is_already_reset"].map((x) => x)),
        password: json["password"] == null ? null : List<String>.from(json["password"].map((x) => x)),
        invalidDefaultPassword: json["invalid_credentials"] == null ? null : List<String>.from(json["invalid_credentials"].map((x) => x)),
        invalidWorkingHours: json["invalid_working_hours"] == null ? null : List<String>.from(json["invalid_working_hours"].map((x) => x)),
        // assigneeFutureBookings: json["assignee_future_bookings"] == null? null : List<String>.from(json["assignee_future_bookings"].map((x) => x)),
        // closeBookingSlotClosed: json["errors"] == null ? null : List<String>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "business_id": List<dynamic>.from((businessId ?? []).map((x) => x)),
        "role_id": List<dynamic>.from((roleId ?? []).map((x) => x)),
        "email": List<dynamic>.from((email ?? []).map((x) => x)),
        "contact_number": List<dynamic>.from((contactNumber ?? []).map((x) => x)),
        "name": List<dynamic>.from((name ?? []).map((x) => x)),
        "firebase_uid": List<dynamic>.from((firebaseUid ?? []).map((x) => x)),
        "invalid_credintials": List<String>.from((invalidCredentials ?? []).map((x) => x)),
        "password_is_already_reset": List<String>.from((passwordIsAlreadyReset ?? []).map((x) => x)),
        "password": List<String>.from((password ?? []).map((x) => x)),
        "invalid_credentials": List<String>.from((invalidDefaultPassword ?? []).map((x) => x)),
        "invalid_working_hours": List<String>.from((invalidWorkingHours ?? []).map((x) => x)),
        // "message": List<String>.from((closeBookingSlotClosed??[]).map((x) => x)),
      };
}
