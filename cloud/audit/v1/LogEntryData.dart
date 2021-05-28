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
//     final logEntryData = logEntryDataFromJson(jsonString);

import 'dart:convert';

LogEntryData logEntryDataFromJson(String str) => LogEntryData.fromJson(json.decode(str));

String logEntryDataToJson(LogEntryData data) => json.encode(data.toJson());

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

    factory LogEntryData.fromJson(Map<String, dynamic> json) => LogEntryData(
        insertId: json["insertId"] == null ? null : json["insertId"],
        labels: json["labels"] == null ? null : Map.from(json["labels"]).map((k, v) => MapEntry<String, String>(k, v)),
        logName: json["logName"] == null ? null : json["logName"],
        operation: json["operation"] == null ? null : Operation.fromJson(json["operation"]),
        protoPayload: json["protoPayload"] == null ? null : ProtoPayload.fromJson(json["protoPayload"]),
        receiveTimestamp: json["receiveTimestamp"] == null ? null : DateTime.parse(json["receiveTimestamp"]),
        resource: json["resource"] == null ? null : Resource.fromJson(json["resource"]),
        severity: json["severity"],
        spanId: json["spanId"] == null ? null : json["spanId"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        trace: json["trace"] == null ? null : json["trace"],
    );

    Map<String, dynamic> toJson() => {
        "insertId": insertId == null ? null : insertId,
        "labels": labels == null ? null : Map.from(labels).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "logName": logName == null ? null : logName,
        "operation": operation == null ? null : operation.toJson(),
        "protoPayload": protoPayload == null ? null : protoPayload.toJson(),
        "receiveTimestamp": receiveTimestamp == null ? null : receiveTimestamp.toIso8601String(),
        "resource": resource == null ? null : resource.toJson(),
        "severity": severity,
        "spanId": spanId == null ? null : spanId,
        "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
        "trace": trace == null ? null : trace,
    };
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

    factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        first: json["first"] == null ? null : json["first"],
        id: json["id"] == null ? null : json["id"],
        last: json["last"] == null ? null : json["last"],
        producer: json["producer"] == null ? null : json["producer"],
    );

    Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "id": id == null ? null : id,
        "last": last == null ? null : last,
        "producer": producer == null ? null : producer,
    };
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

    factory ProtoPayload.fromJson(Map<String, dynamic> json) => ProtoPayload(
        authenticationInfo: json["authenticationInfo"] == null ? null : AuthenticationInfo.fromJson(json["authenticationInfo"]),
        authorizationInfo: json["authorizationInfo"] == null ? null : List<AuthorizationInfo>.from(json["authorizationInfo"].map((x) => AuthorizationInfo.fromJson(x))),
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        methodName: json["methodName"] == null ? null : json["methodName"],
        numResponseItems: json["numResponseItems"] == null ? null : json["numResponseItems"],
        request: json["request"] == null ? null : Request.fromJson(json["request"]),
        requestMetadata: json["requestMetadata"] == null ? null : RequestMetadata.fromJson(json["requestMetadata"]),
        resourceLocation: json["resourceLocation"] == null ? null : ResourceLocation.fromJson(json["resourceLocation"]),
        resourceName: json["resourceName"] == null ? null : json["resourceName"],
        resourceOriginalState: json["resourceOriginalState"] == null ? null : ResourceOriginalState.fromJson(json["resourceOriginalState"]),
        response: json["response"] == null ? null : Response.fromJson(json["response"]),
        serviceData: json["serviceData"] == null ? null : ServiceData.fromJson(json["serviceData"]),
        serviceName: json["serviceName"] == null ? null : json["serviceName"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "authenticationInfo": authenticationInfo == null ? null : authenticationInfo.toJson(),
        "authorizationInfo": authorizationInfo == null ? null : List<dynamic>.from(authorizationInfo.map((x) => x.toJson())),
        "metadata": metadata == null ? null : metadata.toJson(),
        "methodName": methodName == null ? null : methodName,
        "numResponseItems": numResponseItems == null ? null : numResponseItems,
        "request": request == null ? null : request.toJson(),
        "requestMetadata": requestMetadata == null ? null : requestMetadata.toJson(),
        "resourceLocation": resourceLocation == null ? null : resourceLocation.toJson(),
        "resourceName": resourceName == null ? null : resourceName,
        "resourceOriginalState": resourceOriginalState == null ? null : resourceOriginalState.toJson(),
        "response": response == null ? null : response.toJson(),
        "serviceData": serviceData == null ? null : serviceData.toJson(),
        "serviceName": serviceName == null ? null : serviceName,
        "status": status == null ? null : status.toJson(),
    };
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

    factory AuthenticationInfo.fromJson(Map<String, dynamic> json) => AuthenticationInfo(
        authoritySelector: json["authoritySelector"] == null ? null : json["authoritySelector"],
        principalEmail: json["principalEmail"] == null ? null : json["principalEmail"],
        principalSubject: json["principalSubject"] == null ? null : json["principalSubject"],
        serviceAccountDelegationInfo: json["serviceAccountDelegationInfo"] == null ? null : List<ServiceAccountDelegationInfo>.from(json["serviceAccountDelegationInfo"].map((x) => ServiceAccountDelegationInfo.fromJson(x))),
        serviceAccountKeyName: json["serviceAccountKeyName"] == null ? null : json["serviceAccountKeyName"],
        thirdPartyPrincipal: json["thirdPartyPrincipal"] == null ? null : AuthenticationInfoThirdPartyPrincipal.fromJson(json["thirdPartyPrincipal"]),
    );

    Map<String, dynamic> toJson() => {
        "authoritySelector": authoritySelector == null ? null : authoritySelector,
        "principalEmail": principalEmail == null ? null : principalEmail,
        "principalSubject": principalSubject == null ? null : principalSubject,
        "serviceAccountDelegationInfo": serviceAccountDelegationInfo == null ? null : List<dynamic>.from(serviceAccountDelegationInfo.map((x) => x.toJson())),
        "serviceAccountKeyName": serviceAccountKeyName == null ? null : serviceAccountKeyName,
        "thirdPartyPrincipal": thirdPartyPrincipal == null ? null : thirdPartyPrincipal.toJson(),
    };
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

    factory ServiceAccountDelegationInfo.fromJson(Map<String, dynamic> json) => ServiceAccountDelegationInfo(
        firstPartyPrincipal: json["firstPartyPrincipal"] == null ? null : FirstPartyPrincipal.fromJson(json["firstPartyPrincipal"]),
        thirdPartyPrincipal: json["thirdPartyPrincipal"] == null ? null : ServiceAccountDelegationInfoThirdPartyPrincipal.fromJson(json["thirdPartyPrincipal"]),
    );

    Map<String, dynamic> toJson() => {
        "firstPartyPrincipal": firstPartyPrincipal == null ? null : firstPartyPrincipal.toJson(),
        "thirdPartyPrincipal": thirdPartyPrincipal == null ? null : thirdPartyPrincipal.toJson(),
    };
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

    factory FirstPartyPrincipal.fromJson(Map<String, dynamic> json) => FirstPartyPrincipal(
        principalEmail: json["principalEmail"] == null ? null : json["principalEmail"],
        serviceMetadata: json["serviceMetadata"] == null ? null : ServiceMetadata.fromJson(json["serviceMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "principalEmail": principalEmail == null ? null : principalEmail,
        "serviceMetadata": serviceMetadata == null ? null : serviceMetadata.toJson(),
    };
}

/**
 * Metadata about the service that uses the service account.
 */
class ServiceMetadata {
    ServiceMetadata({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;

    factory ServiceMetadata.fromJson(Map<String, dynamic> json) => ServiceMetadata(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}

/**
 * Third party identity as the real authority.
 */
class ServiceAccountDelegationInfoThirdPartyPrincipal {
    ServiceAccountDelegationInfoThirdPartyPrincipal({
        this.thirdPartyClaims,
    });

    ThirdPartyClaims thirdPartyClaims;

    factory ServiceAccountDelegationInfoThirdPartyPrincipal.fromJson(Map<String, dynamic> json) => ServiceAccountDelegationInfoThirdPartyPrincipal(
        thirdPartyClaims: json["thirdPartyClaims"] == null ? null : ThirdPartyClaims.fromJson(json["thirdPartyClaims"]),
    );

    Map<String, dynamic> toJson() => {
        "thirdPartyClaims": thirdPartyClaims == null ? null : thirdPartyClaims.toJson(),
    };
}

/**
 * Metadata about third party identity.
 */
class ThirdPartyClaims {
    ThirdPartyClaims({
        this.fields,
    });

    Map<String, Map<String, dynamic>> fields;

    factory ThirdPartyClaims.fromJson(Map<String, dynamic> json) => ThirdPartyClaims(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory AuthenticationInfoThirdPartyPrincipal.fromJson(Map<String, dynamic> json) => AuthenticationInfoThirdPartyPrincipal(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory AuthorizationInfo.fromJson(Map<String, dynamic> json) => AuthorizationInfo(
        granted: json["granted"] == null ? null : json["granted"],
        permission: json["permission"] == null ? null : json["permission"],
        resource: json["resource"] == null ? null : json["resource"],
        resourceAttributes: json["resourceAttributes"] == null ? null : ResourceAttributes.fromJson(json["resourceAttributes"]),
    );

    Map<String, dynamic> toJson() => {
        "granted": granted == null ? null : granted,
        "permission": permission == null ? null : permission,
        "resource": resource == null ? null : resource,
        "resourceAttributes": resourceAttributes == null ? null : resourceAttributes.toJson(),
    };
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

    factory ResourceAttributes.fromJson(Map<String, dynamic> json) => ResourceAttributes(
        labels: json["labels"] == null ? null : Map.from(json["labels"]).map((k, v) => MapEntry<String, String>(k, v)),
        name: json["name"] == null ? null : json["name"],
        service: json["service"] == null ? null : json["service"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "labels": labels == null ? null : Map.from(labels).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "name": name == null ? null : name,
        "service": service == null ? null : service,
        "type": type == null ? null : type,
    };
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

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory RequestMetadata.fromJson(Map<String, dynamic> json) => RequestMetadata(
        callerIp: json["callerIp"] == null ? null : json["callerIp"],
        callerNetwork: json["callerNetwork"] == null ? null : json["callerNetwork"],
        callerSuppliedUserAgent: json["callerSuppliedUserAgent"] == null ? null : json["callerSuppliedUserAgent"],
        destinationAttributes: json["destinationAttributes"] == null ? null : DestinationAttributes.fromJson(json["destinationAttributes"]),
        requestAttributes: json["requestAttributes"] == null ? null : RequestAttributes.fromJson(json["requestAttributes"]),
    );

    Map<String, dynamic> toJson() => {
        "callerIp": callerIp == null ? null : callerIp,
        "callerNetwork": callerNetwork == null ? null : callerNetwork,
        "callerSuppliedUserAgent": callerSuppliedUserAgent == null ? null : callerSuppliedUserAgent,
        "destinationAttributes": destinationAttributes == null ? null : destinationAttributes.toJson(),
        "requestAttributes": requestAttributes == null ? null : requestAttributes.toJson(),
    };
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

    factory DestinationAttributes.fromJson(Map<String, dynamic> json) => DestinationAttributes(
        ip: json["ip"] == null ? null : json["ip"],
        labels: json["labels"] == null ? null : Map.from(json["labels"]).map((k, v) => MapEntry<String, String>(k, v)),
        port: json["port"] == null ? null : json["port"],
        principal: json["principal"] == null ? null : json["principal"],
        regionCode: json["regionCode"] == null ? null : json["regionCode"],
    );

    Map<String, dynamic> toJson() => {
        "ip": ip == null ? null : ip,
        "labels": labels == null ? null : Map.from(labels).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "port": port == null ? null : port,
        "principal": principal == null ? null : principal,
        "regionCode": regionCode == null ? null : regionCode,
    };
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

    factory RequestAttributes.fromJson(Map<String, dynamic> json) => RequestAttributes(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        headers: json["headers"] == null ? null : Map.from(json["headers"]).map((k, v) => MapEntry<String, String>(k, v)),
        host: json["host"] == null ? null : json["host"],
        id: json["id"] == null ? null : json["id"],
        method: json["method"] == null ? null : json["method"],
        path: json["path"] == null ? null : json["path"],
        protocol: json["protocol"] == null ? null : json["protocol"],
        query: json["query"] == null ? null : json["query"],
        reason: json["reason"] == null ? null : json["reason"],
        scheme: json["scheme"] == null ? null : json["scheme"],
        size: json["size"] == null ? null : json["size"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "headers": headers == null ? null : Map.from(headers).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "host": host == null ? null : host,
        "id": id == null ? null : id,
        "method": method == null ? null : method,
        "path": path == null ? null : path,
        "protocol": protocol == null ? null : protocol,
        "query": query == null ? null : query,
        "reason": reason == null ? null : reason,
        "scheme": scheme == null ? null : scheme,
        "size": size == null ? null : size,
        "time": time == null ? null : time.toIso8601String(),
    };
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

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        accessLevels: json["accessLevels"] == null ? null : List<String>.from(json["accessLevels"].map((x) => x)),
        audiences: json["audiences"] == null ? null : List<String>.from(json["audiences"].map((x) => x)),
        claims: json["claims"] == null ? null : Claims.fromJson(json["claims"]),
        presenter: json["presenter"] == null ? null : json["presenter"],
        principal: json["principal"] == null ? null : json["principal"],
    );

    Map<String, dynamic> toJson() => {
        "accessLevels": accessLevels == null ? null : List<dynamic>.from(accessLevels.map((x) => x)),
        "audiences": audiences == null ? null : List<dynamic>.from(audiences.map((x) => x)),
        "claims": claims == null ? null : claims.toJson(),
        "presenter": presenter == null ? null : presenter,
        "principal": principal == null ? null : principal,
    };
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

    factory Claims.fromJson(Map<String, dynamic> json) => Claims(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory ResourceLocation.fromJson(Map<String, dynamic> json) => ResourceLocation(
        currentLocations: json["currentLocations"] == null ? null : List<String>.from(json["currentLocations"].map((x) => x)),
        originalLocations: json["originalLocations"] == null ? null : List<String>.from(json["originalLocations"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "currentLocations": currentLocations == null ? null : List<dynamic>.from(currentLocations.map((x) => x)),
        "originalLocations": originalLocations == null ? null : List<dynamic>.from(originalLocations.map((x) => x)),
    };
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

    factory ResourceOriginalState.fromJson(Map<String, dynamic> json) => ResourceOriginalState(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
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

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"] == null ? null : json["code"],
        details: json["details"] == null ? null : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "details": details == null ? null : List<dynamic>.from(details.map((x) => x.toJson())),
        "message": message == null ? null : message,
    };
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

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        typeUrl: json["typeUrl"] == null ? null : json["typeUrl"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "typeUrl": typeUrl == null ? null : typeUrl,
        "value": value == null ? null : value,
    };
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

    factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        labels: json["labels"] == null ? null : Map.from(json["labels"]).map((k, v) => MapEntry<String, String>(k, v)),
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "labels": labels == null ? null : Map.from(labels).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "type": type == null ? null : type,
    };
}

enum InsertId { DEFAULT, DEBUG, INFO, NOTICE, WARNING, ERROR, CRITICAL, ALERT, EMERGENCY }

final insertIdValues = EnumValues({
    "ALERT": InsertId.ALERT,
    "CRITICAL": InsertId.CRITICAL,
    "DEBUG": InsertId.DEBUG,
    "DEFAULT": InsertId.DEFAULT,
    "EMERGENCY": InsertId.EMERGENCY,
    "ERROR": InsertId.ERROR,
    "INFO": InsertId.INFO,
    "NOTICE": InsertId.NOTICE,
    "WARNING": InsertId.WARNING
});

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
