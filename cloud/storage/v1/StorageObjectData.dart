// Copyright 2020 Google LLC
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
    String generation;
    String id;
    String kind;
    String kmsKeyName;
    String md5Hash;
    String mediaLink;
    Map<String, String> metadata;
    String metageneration;
    String name;
    DateTime retentionExpirationTime;
    String selfLink;
    String size;
    String storageClass;
    bool temporaryHold;
    DateTime timeCreated;
    DateTime timeDeleted;
    DateTime timeStorageClassUpdated;
    DateTime updated;
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
}
