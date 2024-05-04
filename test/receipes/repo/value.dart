import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/abstract_value.dart';

///inputs
final Map<String, dynamic> successInput = <String, dynamic>{
  'password': '112211',
  'fcm_token': null,
  'os_type': Platform.isIOS ? "ios" : 'android',
  'identity_id': '1011223344',
};

final Map<String, dynamic> failureInput = <String, dynamic>{
  'identity_id': '1011223344',
  'password': '112212',
  'fcm_token': null,
  'os_type': Platform.isIOS ? "ios" : 'android'
};

///output
Map<String, dynamic> successLogin = <String, dynamic>{
  "status_code": 200,
  "code": 1020,
  "hint": "Processed Successfully",
  "success": true,
  "data": <String, dynamic>{
    "user": <String, dynamic>{
      "id": 28,
      "is_parent": true,
      "is_child": false,
      "user_type": <String, dynamic>{"id": 1, "slug": "individual", "title": "فرد"},
      "currency": <String, dynamic>{
        "name": "ريال سعودي",
        "code": "sar",
        "flag": "https://cdn.eightyythree.com//public/uploads/currencies/sa.svg"
      },
      "country": <String, dynamic>{"id": 1, "code": "SAU", "title": "المملكة العربية السعودية"},
      "language": "ar",
      "identity": 1011223300,
      "full_name": "Test User_1669277849",
      "phone_number": "96616",
      "email": "f@f.o",
      "refferal_code": "c_637f2899c5d5d2.03165721",
      "refferal_invest": "invest_637f2899c6b279.32008357",
      "verified": true,
      "is_completed": true,
      "verification_code": "2548",
      "token": "Bearer 36|a9m2qcbFlZu8OFi99ay2LW1EMNM7IFx5zTI9XZjM",
      "is_active": true,
      "custome_fields": <Map<String, dynamic>>[
        <String, dynamic>{"key": "dob", "value": "1988-08-01"}
      ],
      "is_professional": false,
      "upgrade_to_pro_status": null,
      "face_id_activated": false,
      "touch_id_activated": false,
      "pincode": null
    },
    "permissions": <Map<String, dynamic>>[]
  }
};

Map<String, dynamic> failureLogin = <String, dynamic>{
  "status_code": 400,
  "code": 1060,
  "hint": "Wrong Password",
  "success": false,
  "errors": <String, dynamic>{"error": "الرقم السرى خطأ"}
};

///class
ValueClass loginValues = ValueClass(
  successfulResponse: successLogin,
  failureResponse: failureLogin,
  successfulBody: FormData.fromMap(successInput),
  failureBody: FormData.fromMap(failureInput),
  path: '',
);
