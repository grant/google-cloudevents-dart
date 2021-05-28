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
//     final referenceEventData = referenceEventDataFromJson(jsonString);

import 'dart:convert';

ReferenceEventData referenceEventDataFromJson(String str) => ReferenceEventData.fromJson(json.decode(str));

String referenceEventDataToJson(ReferenceEventData data) => json.encode(data.toJson());

/**
 * The data within all Firebase Real Time Database reference events.
 */
class ReferenceEventData {
    ReferenceEventData({
        this.data,
        this.delta,
    });

    Map<String, dynamic> data;
    Map<String, dynamic> delta;

    factory ReferenceEventData.fromJson(Map<String, dynamic> json) => ReferenceEventData(
        data: json["data"] == null ? null : Map.from(json["data"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        delta: json["delta"] == null ? null : Map.from(json["delta"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "delta": delta == null ? null : Map.from(delta).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
