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
}

/**
 * Additional metadata about the user.
 */
class Metadata {
    Metadata({
        this.createdAt,
        this.lastSignedInAt,
    });

    DateTime createdAt;
    DateTime lastSignedInAt;
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
}
