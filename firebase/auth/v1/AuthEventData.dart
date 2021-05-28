// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// To parse this JSON data, do
//
//     final authEventData = authEventDataFromJson(jsonString);

import 'dart:convert';

AuthEventData authEventDataFromJson(String str) => AuthEventData.fromJson(json.decode(str));

String authEventDataToJson(AuthEventData data) => json.encode(data.toJson());

/**
 * The data within all Firebase Auth events.
 */
class AuthEventData {
    AuthEventData({
        this.customClaims,
        this.disabled,
        this.displayName,
        this.email,
        this.emailVerified,
        this.metadata,
        this.phoneNumber,
        this.photoUrl,
        this.providerData,
        this.uid,
    });

    CustomClaims customClaims;
    bool disabled;
    String displayName;
    String email;
    bool emailVerified;
    Metadata metadata;
    String phoneNumber;
    String photoUrl;
    List<ProviderDatum> providerData;
    String uid;

    factory AuthEventData.fromJson(Map<String, dynamic> json) => AuthEventData(
        customClaims: json["customClaims"] == null ? null : CustomClaims.fromJson(json["customClaims"]),
        disabled: json["disabled"] == null ? null : json["disabled"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        email: json["email"] == null ? null : json["email"],
        emailVerified: json["emailVerified"] == null ? null : json["emailVerified"],
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        photoUrl: json["photoURL"] == null ? null : json["photoURL"],
        providerData: json["providerData"] == null ? null : List<ProviderDatum>.from(json["providerData"].map((x) => ProviderDatum.fromJson(x))),
        uid: json["uid"] == null ? null : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "customClaims": customClaims == null ? null : customClaims.toJson(),
        "disabled": disabled == null ? null : disabled,
        "displayName": displayName == null ? null : displayName,
        "email": email == null ? null : email,
        "emailVerified": emailVerified == null ? null : emailVerified,
        "metadata": metadata == null ? null : metadata.toJson(),
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "photoURL": photoUrl == null ? null : photoUrl,
        "providerData": providerData == null ? null : List<dynamic>.from(providerData.map((x) => x.toJson())),
        "uid": uid == null ? null : uid,
    };
}

/**
 * User's custom claims, typically used to define user roles and propagated
 * to an authenticated user's ID token.
 */
class CustomClaims {
    CustomClaims({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;

    factory CustomClaims.fromJson(Map<String, dynamic> json) => CustomClaims(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}

/**
 * Additional metadata about the user.
 */
class Metadata {
    Metadata({
        this.createTime,
        this.lastSignInTime,
    });

    DateTime createTime;
    DateTime lastSignInTime;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        createTime: json["createTime"] == null ? null : DateTime.parse(json["createTime"]),
        lastSignInTime: json["lastSignInTime"] == null ? null : DateTime.parse(json["lastSignInTime"]),
    );

    Map<String, dynamic> toJson() => {
        "createTime": createTime == null ? null : createTime.toIso8601String(),
        "lastSignInTime": lastSignInTime == null ? null : lastSignInTime.toIso8601String(),
    };
}

/**
 * User's info at the identity provider
 */
class ProviderDatum {
    ProviderDatum({
        this.displayName,
        this.email,
        this.photoUrl,
        this.providerId,
        this.uid,
    });

    String displayName;
    String email;
    String photoUrl;
    String providerId;
    String uid;

    factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
        displayName: json["displayName"] == null ? null : json["displayName"],
        email: json["email"] == null ? null : json["email"],
        photoUrl: json["photoURL"] == null ? null : json["photoURL"],
        providerId: json["providerId"] == null ? null : json["providerId"],
        uid: json["uid"] == null ? null : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "displayName": displayName == null ? null : displayName,
        "email": email == null ? null : email,
        "photoURL": photoUrl == null ? null : photoUrl,
        "providerId": providerId == null ? null : providerId,
        "uid": uid == null ? null : uid,
    };
}
