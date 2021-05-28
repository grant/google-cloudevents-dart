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
 * The data within all Cloud Audit Logs log entry events.
 */
class LogEntryData {
    LogEntryData({
        this.insertId,
        this.labels,
        this.logName,
        this.operation,
        this.protoPayload,
        this.receiveTimestamp,
        this.resource,
        this.severity,
        this.spanId,
        this.timestamp,
        this.trace,
    });

    String insertId;
    Map<String, String> labels;
    String logName;
    Operation operation;
    ProtoPayload protoPayload;
    DateTime receiveTimestamp;
    Resource resource;
    dynamic severity;
    String spanId;
    DateTime timestamp;
    String trace;
}

/**
 * Information about an operation associated with the log entry, if
 * applicable.
 */
class Operation {
    Operation({
        this.first,
        this.id,
        this.last,
        this.producer,
    });

    bool first;
    String id;
    bool last;
    String producer;
}

/**
 * The log entry payload, which is always an AuditLog for Cloud Audit Log
 * events.
 */
class ProtoPayload {
    ProtoPayload({
        this.authenticationInfo,
        this.authorizationInfo,
        this.metadata,
        this.methodName,
        this.numResponseItems,
        this.request,
        this.requestMetadata,
        this.resourceLocation,
        this.resourceName,
        this.resourceOriginalState,
        this.response,
        this.serviceData,
        this.serviceName,
        this.status,
    });

    AuthenticationInfo authenticationInfo;
    List<AuthorizationInfo> authorizationInfo;
    Metadata metadata;
    String methodName;
    int numResponseItems;
    Request request;
    RequestMetadata requestMetadata;
    ResourceLocation resourceLocation;
    String resourceName;
    ResourceOriginalState resourceOriginalState;
    Response response;
    ServiceData serviceData;
    String serviceName;
    Status status;
}

/**
 * Authentication information.
 */
class AuthenticationInfo {
    AuthenticationInfo({
        this.authoritySelector,
        this.principalEmail,
        this.principalSubject,
        this.serviceAccountDelegationInfo,
        this.serviceAccountKeyName,
        this.thirdPartyPrincipal,
    });

    String authoritySelector;
    String principalEmail;
    String principalSubject;
    List<ServiceAccountDelegationInfo> serviceAccountDelegationInfo;
    String serviceAccountKeyName;
    AuthenticationInfoThirdPartyPrincipal thirdPartyPrincipal;
}

/**
 * Identity delegation history of an authenticated service account.
 */
class ServiceAccountDelegationInfo {
    ServiceAccountDelegationInfo({
        this.firstPartyPrincipal,
        this.thirdPartyPrincipal,
    });

    FirstPartyPrincipal firstPartyPrincipal;
    ServiceAccountDelegationInfoThirdPartyPrincipal thirdPartyPrincipal;
}

/**
 * First party (Google) identity as the real authority.
 */
class FirstPartyPrincipal {
    FirstPartyPrincipal({
        this.principalEmail,
        this.serviceMetadata,
    });

    String principalEmail;
    ServiceMetadata serviceMetadata;
}

/**
 * Metadata about the service that uses the service account.
 */
class ServiceMetadata {
    ServiceMetadata({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * Third party identity as the real authority.
 */
class ServiceAccountDelegationInfoThirdPartyPrincipal {
    ServiceAccountDelegationInfoThirdPartyPrincipal({
        this.thirdPartyClaims,
    });

    ThirdPartyClaims thirdPartyClaims;
}

/**
 * Metadata about third party identity.
 */
class ThirdPartyClaims {
    ThirdPartyClaims({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * The third party identification (if any) of the authenticated user making
 * the request.
 * When the JSON object represented here has a proto equivalent, the proto
 * name will be indicated in the `@type` property.
 */
class AuthenticationInfoThirdPartyPrincipal {
    AuthenticationInfoThirdPartyPrincipal({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * Authorization information for the operation.
 */
class AuthorizationInfo {
    AuthorizationInfo({
        this.granted,
        this.permission,
        this.resource,
        this.resourceAttributes,
    });

    bool granted;
    String permission;
    String resource;
    ResourceAttributes resourceAttributes;
}

/**
 * Resource attributes used in IAM condition evaluation. This field contains
 * resource attributes like resource type and resource name.
 *
 * To get the whole view of the attributes used in IAM
 * condition evaluation, the user must also look into
 * `AuditLogData.request_metadata.request_attributes`.
 */
class ResourceAttributes {
    ResourceAttributes({
        this.labels,
        this.name,
        this.service,
        this.type,
    });

    Map<String, String> labels;
    String name;
    String service;
    String type;
}

/**
 * Other service-specific data about the request, response, and other
 * information associated with the current audited event.
 */
class Metadata {
    Metadata({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * The operation request. This may not include all request parameters,
 * such as those that are too large, privacy-sensitive, or duplicated
 * elsewhere in the log record.
 * It should never include user-generated data, such as file contents.
 * When the JSON object represented here has a proto equivalent, the proto
 * name will be indicated in the `@type` property.
 */
class Request {
    Request({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * Metadata about the operation.
 */
class RequestMetadata {
    RequestMetadata({
        this.callerIp,
        this.callerNetwork,
        this.callerSuppliedUserAgent,
        this.destinationAttributes,
        this.requestAttributes,
    });

    String callerIp;
    String callerNetwork;
    String callerSuppliedUserAgent;
    DestinationAttributes destinationAttributes;
    RequestAttributes requestAttributes;
}

/**
 * The destination of a network activity, such as accepting a TCP connection.
 * In a multi hop network activity, the destination represents the receiver of
 * the last hop. Only two fields are used in this message, Peer.port and
 * Peer.ip. These fields are optionally populated by those services utilizing
 * the IAM condition feature.
 */
class DestinationAttributes {
    DestinationAttributes({
        this.ip,
        this.labels,
        this.port,
        this.principal,
        this.regionCode,
    });

    String ip;
    Map<String, String> labels;
    int port;
    String principal;
    String regionCode;
}

/**
 * Request attributes used in IAM condition evaluation. This field contains
 * request attributes like request time and access levels associated with
 * the request.
 *
 *
 * To get the whole view of the attributes used in IAM
 * condition evaluation, the user must also look into
 * `AuditLog.authentication_info.resource_attributes`.
 */
class RequestAttributes {
    RequestAttributes({
        this.auth,
        this.headers,
        this.host,
        this.id,
        this.method,
        this.path,
        this.protocol,
        this.query,
        this.reason,
        this.scheme,
        this.size,
        this.time,
    });

    Auth auth;
    Map<String, String> headers;
    String host;
    String id;
    String method;
    String path;
    String protocol;
    String query;
    String reason;
    String scheme;
    int size;
    DateTime time;
}

/**
 * The request authentication. May be absent for unauthenticated requests.
 * Derived from the HTTP request `Authorization` header or equivalent.
 */
class Auth {
    Auth({
        this.accessLevels,
        this.audiences,
        this.claims,
        this.presenter,
        this.principal,
    });

    List<String> accessLevels;
    List<String> audiences;
    Claims claims;
    String presenter;
    String principal;
}

/**
 * Structured claims presented with the credential. JWTs include
 * `{key: value}` pairs for standard and private claims. The following
 * is a subset of the standard required and optional claims that would
 * typically be presented for a Google-based JWT:
 *
 * {'iss': 'accounts.google.com',
 * 'sub': '113289723416554971153',
 * 'aud': ['123456789012', 'pubsub.googleapis.com'],
 * 'azp': '123456789012.apps.googleusercontent.com',
 * 'email': 'jsmith@example.com',
 * 'iat': 1353601026,
 * 'exp': 1353604926}
 *
 * SAML assertions are similarly specified, but with an identity provider
 * dependent structure.
 */
class Claims {
    Claims({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * The resource location information.
 */
class ResourceLocation {
    ResourceLocation({
        this.currentLocations,
        this.originalLocations,
    });

    List<String> currentLocations;
    List<String> originalLocations;
}

/**
 * The resource's original state before mutation. Present only for
 * operations which have successfully modified the targeted resource(s).
 * In general, this field should contain all changed fields, except those
 * that are already been included in `request`, `response`, `metadata` or
 * `service_data` fields.
 * When the JSON object represented here has a proto equivalent,
 * the proto name will be indicated in the `@type` property.
 */
class ResourceOriginalState {
    ResourceOriginalState({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * The operation response. This may not include all response elements,
 * such as those that are too large, privacy-sensitive, or duplicated
 * elsewhere in the log record.
 * It should never include user-generated data, such as file contents.
 * When the JSON object represented here has a proto equivalent, the proto
 * name will be indicated in the `@type` property.
 */
class Response {
    Response({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * Deprecated: Use `metadata` field instead.
 * Other service-specific data about the request, response, and other
 * activities.
 * When the JSON object represented here has a proto equivalent, the proto
 * name will be indicated in the `@type` property.
 */
class ServiceData {
    ServiceData({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;
}

/**
 * The status of the overall operation.
 */
class Status {
    Status({
        this.code,
        this.details,
        this.message,
    });

    int code;
    List<Detail> details;
    String message;
}

/**
 * `Any` contains an arbitrary serialized protocol buffer message along with a
 * URL that describes the type of the serialized message.
 *
 * Protobuf library provides support to pack/unpack Any values in the form
 * of utility functions or additional generated methods of the Any type.
 *
 * Example 1: Pack and unpack a message in C++.
 *
 * Foo foo = ...;
 * Any any;
 * any.PackFrom(foo);
 * ...
 * if (any.UnpackTo(&foo)) {
 * ...
 * }
 *
 * Example 2: Pack and unpack a message in Java.
 *
 * Foo foo = ...;
 * Any any = Any.pack(foo);
 * ...
 * if (any.is(Foo.class)) {
 * foo = any.unpack(Foo.class);
 * }
 *
 * Example 3: Pack and unpack a message in Python.
 *
 * foo = Foo(...)
 * any = Any()
 * any.Pack(foo)
 * ...
 * if any.Is(Foo.DESCRIPTOR):
 * any.Unpack(foo)
 * ...
 *
 * Example 4: Pack and unpack a message in Go
 *
 * foo := &pb.Foo{...}
 * any, err := ptypes.MarshalAny(foo)
 * ...
 * foo := &pb.Foo{}
 * if err := ptypes.UnmarshalAny(any, foo); err != nil {
 * ...
 * }
 *
 * The pack methods provided by protobuf library will by default use
 * 'type.googleapis.com/full.type.name' as the type URL and the unpack
 * methods only use the fully qualified type name after the last '/'
 * in the type URL, for example "foo.bar.com/x/y.z" will yield type
 * name "y.z".
 *
 *
 * JSON
 * ====
 * The JSON representation of an `Any` value uses the regular
 * representation of the deserialized, embedded message, with an
 * additional field `@type` which contains the type URL. Example:
 *
 * package google.profile;
 * message Person {
 * string first_name = 1;
 * string last_name = 2;
 * }
 *
 * {
 * "@type": "type.googleapis.com/google.profile.Person",
 * "firstName": <string>,
 * "lastName": <string>
 * }
 *
 * If the embedded message type is well-known and has a custom JSON
 * representation, that representation will be embedded adding a field
 * `value` which holds the custom JSON in addition to the `@type`
 * field. Example (for message [google.protobuf.Duration][]):
 *
 * {
 * "@type": "type.googleapis.com/google.protobuf.Duration",
 * "value": "1.212s"
 * }
 */
class Detail {
    Detail({
        this.typeUrl,
        this.value,
    });

    String typeUrl;
    String value;
}

/**
 * The monitored resource that produced this log entry.
 *
 * Example: a log entry that reports a database error would be associated with
 * the monitored resource designating the particular database that reported
 * the error.
 */
class Resource {
    Resource({
        this.labels,
        this.type,
    });

    Map<String, String> labels;
    String type;
}

enum InsertId { DEFAULT, DEBUG, INFO, NOTICE, WARNING, ERROR, CRITICAL, ALERT, EMERGENCY }
