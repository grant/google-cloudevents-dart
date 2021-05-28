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
//     final messagePublishedData = messagePublishedDataFromJson(jsonString);

import 'dart:convert';

MessagePublishedData messagePublishedDataFromJson(String str) => MessagePublishedData.fromJson(json.decode(str));

String messagePublishedDataToJson(MessagePublishedData data) => json.encode(data.toJson());

/**
 * The event data when a message is published to a topic.
 */
class MessagePublishedData {
    MessagePublishedData({
        this.message,
        this.subscription,
    });

    Message message;
    String subscription;

    factory MessagePublishedData.fromJson(Map<String, dynamic> json) => MessagePublishedData(
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        subscription: json["subscription"] == null ? null : json["subscription"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message.toJson(),
        "subscription": subscription == null ? null : subscription,
    };
}

/**
 * The message that was published.
 */
class Message {
    Message({
        this.attributes,
        this.data,
        this.messageId,
        this.orderingKey,
        this.publishTime,
    });

    Map<String, String> attributes;
    String data;
    String messageId;
    String orderingKey;
    DateTime publishTime;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        attributes: json["attributes"] == null ? null : Map.from(json["attributes"]).map((k, v) => MapEntry<String, String>(k, v)),
        data: json["data"] == null ? null : json["data"],
        messageId: json["messageId"] == null ? null : json["messageId"],
        orderingKey: json["orderingKey"] == null ? null : json["orderingKey"],
        publishTime: json["publishTime"] == null ? null : DateTime.parse(json["publishTime"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes == null ? null : Map.from(attributes).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "data": data == null ? null : data,
        "messageId": messageId == null ? null : messageId,
        "orderingKey": orderingKey == null ? null : orderingKey,
        "publishTime": publishTime == null ? null : publishTime.toIso8601String(),
    };
}
