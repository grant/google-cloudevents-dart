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
//     final storageObjectData = storageObjectDataFromJson(jsonString);

import 'dart:convert';

StorageObjectData storageObjectDataFromJson(String str) => StorageObjectData.fromJson(json.decode(str));

String storageObjectDataToJson(StorageObjectData data) => json.encode(data.toJson());

/**
 * An object within Google Cloud Storage.
 */
class StorageObjectData {
    StorageObjectData({
        this.bucket,
        this.cacheControl,
        this.componentCount,
        this.contentDisposition,
        this.contentEncoding,
        this.contentLanguage,
        this.contentType,
        this.crc32C,
        this.customerEncryption,
        this.etag,
        this.eventBasedHold,
        this.generation,
        this.id,
        this.kind,
        this.kmsKeyName,
        this.md5Hash,
        this.mediaLink,
        this.metadata,
        this.metageneration,
        this.name,
        this.retentionExpirationTime,
        this.selfLink,
        this.size,
        this.storageClass,
        this.temporaryHold,
        this.timeCreated,
        this.timeDeleted,
        this.timeStorageClassUpdated,
        this.updated,
    });

    String bucket;
    String cacheControl;
    int componentCount;
    String contentDisposition;
    String contentEncoding;
    String contentLanguage;
    String contentType;
    String crc32C;
    CustomerEncryption customerEncryption;
    String etag;
    bool eventBasedHold;
    int generation;
    String id;
    String kind;
    String kmsKeyName;
    String md5Hash;
    String mediaLink;
    Map<String, String> metadata;
    int metageneration;
    String name;
    DateTime retentionExpirationTime;
    String selfLink;
    int size;
    String storageClass;
    bool temporaryHold;
    DateTime timeCreated;
    DateTime timeDeleted;
    DateTime timeStorageClassUpdated;
    DateTime updated;

    factory StorageObjectData.fromJson(Map<String, dynamic> json) => StorageObjectData(
        bucket: json["bucket"] == null ? null : json["bucket"],
        cacheControl: json["cacheControl"] == null ? null : json["cacheControl"],
        componentCount: json["componentCount"] == null ? null : json["componentCount"],
        contentDisposition: json["contentDisposition"] == null ? null : json["contentDisposition"],
        contentEncoding: json["contentEncoding"] == null ? null : json["contentEncoding"],
        contentLanguage: json["contentLanguage"] == null ? null : json["contentLanguage"],
        contentType: json["contentType"] == null ? null : json["contentType"],
        crc32C: json["crc32c"] == null ? null : json["crc32c"],
        customerEncryption: json["customerEncryption"] == null ? null : CustomerEncryption.fromJson(json["customerEncryption"]),
        etag: json["etag"] == null ? null : json["etag"],
        eventBasedHold: json["eventBasedHold"] == null ? null : json["eventBasedHold"],
        generation: json["generation"] == null ? null : json["generation"],
        id: json["id"] == null ? null : json["id"],
        kind: json["kind"] == null ? null : json["kind"],
        kmsKeyName: json["kmsKeyName"] == null ? null : json["kmsKeyName"],
        md5Hash: json["md5Hash"] == null ? null : json["md5Hash"],
        mediaLink: json["mediaLink"] == null ? null : json["mediaLink"],
        metadata: json["metadata"] == null ? null : Map.from(json["metadata"]).map((k, v) => MapEntry<String, String>(k, v)),
        metageneration: json["metageneration"] == null ? null : json["metageneration"],
        name: json["name"] == null ? null : json["name"],
        retentionExpirationTime: json["retentionExpirationTime"] == null ? null : DateTime.parse(json["retentionExpirationTime"]),
        selfLink: json["selfLink"] == null ? null : json["selfLink"],
        size: json["size"] == null ? null : json["size"],
        storageClass: json["storageClass"] == null ? null : json["storageClass"],
        temporaryHold: json["temporaryHold"] == null ? null : json["temporaryHold"],
        timeCreated: json["timeCreated"] == null ? null : DateTime.parse(json["timeCreated"]),
        timeDeleted: json["timeDeleted"] == null ? null : DateTime.parse(json["timeDeleted"]),
        timeStorageClassUpdated: json["timeStorageClassUpdated"] == null ? null : DateTime.parse(json["timeStorageClassUpdated"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "bucket": bucket == null ? null : bucket,
        "cacheControl": cacheControl == null ? null : cacheControl,
        "componentCount": componentCount == null ? null : componentCount,
        "contentDisposition": contentDisposition == null ? null : contentDisposition,
        "contentEncoding": contentEncoding == null ? null : contentEncoding,
        "contentLanguage": contentLanguage == null ? null : contentLanguage,
        "contentType": contentType == null ? null : contentType,
        "crc32c": crc32C == null ? null : crc32C,
        "customerEncryption": customerEncryption == null ? null : customerEncryption.toJson(),
        "etag": etag == null ? null : etag,
        "eventBasedHold": eventBasedHold == null ? null : eventBasedHold,
        "generation": generation == null ? null : generation,
        "id": id == null ? null : id,
        "kind": kind == null ? null : kind,
        "kmsKeyName": kmsKeyName == null ? null : kmsKeyName,
        "md5Hash": md5Hash == null ? null : md5Hash,
        "mediaLink": mediaLink == null ? null : mediaLink,
        "metadata": metadata == null ? null : Map.from(metadata).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "metageneration": metageneration == null ? null : metageneration,
        "name": name == null ? null : name,
        "retentionExpirationTime": retentionExpirationTime == null ? null : retentionExpirationTime.toIso8601String(),
        "selfLink": selfLink == null ? null : selfLink,
        "size": size == null ? null : size,
        "storageClass": storageClass == null ? null : storageClass,
        "temporaryHold": temporaryHold == null ? null : temporaryHold,
        "timeCreated": timeCreated == null ? null : timeCreated.toIso8601String(),
        "timeDeleted": timeDeleted == null ? null : timeDeleted.toIso8601String(),
        "timeStorageClassUpdated": timeStorageClassUpdated == null ? null : timeStorageClassUpdated.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
    };
}

/**
 * Metadata of customer-supplied encryption key, if the object is encrypted by
 * such a key.
 */
class CustomerEncryption {
    CustomerEncryption({
        this.encryptionAlgorithm,
        this.keySha256,
    });

    String encryptionAlgorithm;
    String keySha256;

    factory CustomerEncryption.fromJson(Map<String, dynamic> json) => CustomerEncryption(
        encryptionAlgorithm: json["encryptionAlgorithm"] == null ? null : json["encryptionAlgorithm"],
        keySha256: json["keySha256"] == null ? null : json["keySha256"],
    );

    Map<String, dynamic> toJson() => {
        "encryptionAlgorithm": encryptionAlgorithm == null ? null : encryptionAlgorithm,
        "keySha256": keySha256 == null ? null : keySha256,
    };
}
