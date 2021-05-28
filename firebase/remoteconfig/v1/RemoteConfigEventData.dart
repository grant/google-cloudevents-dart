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
//     final remoteConfigEventData = remoteConfigEventDataFromJson(jsonString);

import 'dart:convert';

RemoteConfigEventData remoteConfigEventDataFromJson(String str) => RemoteConfigEventData.fromJson(json.decode(str));

String remoteConfigEventDataToJson(RemoteConfigEventData data) => json.encode(data.toJson());

/**
 * The data within all Firebase Remote Config events.
 */
class RemoteConfigEventData {
    RemoteConfigEventData({
        this.description,
        this.rollbackSource,
        this.updateOrigin,
        this.updateTime,
        this.updateType,
        this.updateUser,
        this.versionNumber,
    });

    String description;
    int rollbackSource;
    dynamic updateOrigin;
    DateTime updateTime;
    dynamic updateType;
    UpdateUser updateUser;
    int versionNumber;

    factory RemoteConfigEventData.fromJson(Map<String, dynamic> json) => RemoteConfigEventData(
        description: json["description"] == null ? null : json["description"],
        rollbackSource: json["rollbackSource"] == null ? null : json["rollbackSource"],
        updateOrigin: json["updateOrigin"],
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
        updateType: json["updateType"],
        updateUser: json["updateUser"] == null ? null : UpdateUser.fromJson(json["updateUser"]),
        versionNumber: json["versionNumber"] == null ? null : json["versionNumber"],
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "rollbackSource": rollbackSource == null ? null : rollbackSource,
        "updateOrigin": updateOrigin,
        "updateTime": updateTime == null ? null : updateTime.toIso8601String(),
        "updateType": updateType,
        "updateUser": updateUser == null ? null : updateUser.toJson(),
        "versionNumber": versionNumber == null ? null : versionNumber,
    };
}

enum UpdateOriginEnum { REMOTE_CONFIG_UPDATE_ORIGIN_UNSPECIFIED, CONSOLE, REST_API, ADMIN_SDK_NODE }

final updateOriginEnumValues = EnumValues({
    "ADMIN_SDK_NODE": UpdateOriginEnum.ADMIN_SDK_NODE,
    "CONSOLE": UpdateOriginEnum.CONSOLE,
    "REMOTE_CONFIG_UPDATE_ORIGIN_UNSPECIFIED": UpdateOriginEnum.REMOTE_CONFIG_UPDATE_ORIGIN_UNSPECIFIED,
    "REST_API": UpdateOriginEnum.REST_API
});

enum UpdateTypeEnum { REMOTE_CONFIG_UPDATE_TYPE_UNSPECIFIED, INCREMENTAL_UPDATE, FORCED_UPDATE, ROLLBACK }

final updateTypeEnumValues = EnumValues({
    "FORCED_UPDATE": UpdateTypeEnum.FORCED_UPDATE,
    "INCREMENTAL_UPDATE": UpdateTypeEnum.INCREMENTAL_UPDATE,
    "REMOTE_CONFIG_UPDATE_TYPE_UNSPECIFIED": UpdateTypeEnum.REMOTE_CONFIG_UPDATE_TYPE_UNSPECIFIED,
    "ROLLBACK": UpdateTypeEnum.ROLLBACK
});

/**
 * Aggregation of all metadata fields about the account that performed the
 * update.
 */
class UpdateUser {
    UpdateUser({
        this.email,
        this.imageUrl,
        this.name,
    });

    String email;
    String imageUrl;
    String name;

    factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
        email: json["email"] == null ? null : json["email"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "name": name == null ? null : name,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
