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
}

enum UpdateOriginEnum { REMOTE_CONFIG_UPDATE_ORIGIN_UNSPECIFIED, CONSOLE, REST_API, ADMIN_SDK_NODE }

enum UpdateTypeEnum { REMOTE_CONFIG_UPDATE_TYPE_UNSPECIFIED, INCREMENTAL_UPDATE, FORCED_UPDATE, ROLLBACK }

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
}
