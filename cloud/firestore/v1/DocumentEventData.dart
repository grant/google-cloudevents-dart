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
//     final documentEventData = documentEventDataFromJson(jsonString);

import 'dart:convert';

DocumentEventData documentEventDataFromJson(String str) => DocumentEventData.fromJson(json.decode(str));

String documentEventDataToJson(DocumentEventData data) => json.encode(data.toJson());

/**
 * The data within all Firestore document events.
 */
class DocumentEventData {
    DocumentEventData({
        this.oldValue,
        this.updateMask,
        this.value,
    });

    OldValue oldValue;
    UpdateMask updateMask;
    Value value;

    factory DocumentEventData.fromJson(Map<String, dynamic> json) => DocumentEventData(
        oldValue: json["oldValue"] == null ? null : OldValue.fromJson(json["oldValue"]),
        updateMask: json["updateMask"] == null ? null : UpdateMask.fromJson(json["updateMask"]),
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
    );

    Map<String, dynamic> toJson() => {
        "oldValue": oldValue == null ? null : oldValue.toJson(),
        "updateMask": updateMask == null ? null : updateMask.toJson(),
        "value": value == null ? null : value.toJson(),
    };
}

/**
 * A Document object containing a pre-operation document snapshot.
 * This is only populated for update and delete events.
 *
 * A Firestore document.
 */
class OldValue {
    OldValue({
        this.createTime,
        this.fields,
        this.name,
        this.updateTime,
    });

    DateTime createTime;
    Map<String, OldValueField> fields;
    String name;
    DateTime updateTime;

    factory OldValue.fromJson(Map<String, dynamic> json) => OldValue(
        createTime: json["createTime"] == null ? null : DateTime.parse(json["createTime"]),
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, OldValueField>(k, OldValueField.fromJson(v))),
        name: json["name"] == null ? null : json["name"],
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "createTime": createTime == null ? null : createTime.toIso8601String(),
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "name": name == null ? null : name,
        "updateTime": updateTime == null ? null : updateTime.toIso8601String(),
    };
}

/**
 * A message that can hold any of the supported value types.
 */
class OldValueField {
    OldValueField({
        this.arrayValue,
        this.booleanValue,
        this.bytesValue,
        this.doubleValue,
        this.geoPointValue,
        this.integerValue,
        this.mapValue,
        this.nullValue,
        this.referenceValue,
        this.stringValue,
        this.timestampValue,
    });

    ArrayValue arrayValue;
    bool booleanValue;
    String bytesValue;
    double doubleValue;
    GeoPointValue geoPointValue;
    int integerValue;
    MapValue mapValue;
    dynamic nullValue;
    String referenceValue;
    String stringValue;
    DateTime timestampValue;

    factory OldValueField.fromJson(Map<String, dynamic> json) => OldValueField(
        arrayValue: json["arrayValue"] == null ? null : ArrayValue.fromJson(json["arrayValue"]),
        booleanValue: json["booleanValue"] == null ? null : json["booleanValue"],
        bytesValue: json["bytesValue"] == null ? null : json["bytesValue"],
        doubleValue: json["doubleValue"] == null ? null : json["doubleValue"].toDouble(),
        geoPointValue: json["geoPointValue"] == null ? null : GeoPointValue.fromJson(json["geoPointValue"]),
        integerValue: json["integerValue"] == null ? null : json["integerValue"],
        mapValue: json["mapValue"] == null ? null : MapValue.fromJson(json["mapValue"]),
        nullValue: json["nullValue"],
        referenceValue: json["referenceValue"] == null ? null : json["referenceValue"],
        stringValue: json["stringValue"] == null ? null : json["stringValue"],
        timestampValue: json["timestampValue"] == null ? null : DateTime.parse(json["timestampValue"]),
    );

    Map<String, dynamic> toJson() => {
        "arrayValue": arrayValue == null ? null : arrayValue.toJson(),
        "booleanValue": booleanValue == null ? null : booleanValue,
        "bytesValue": bytesValue == null ? null : bytesValue,
        "doubleValue": doubleValue == null ? null : doubleValue,
        "geoPointValue": geoPointValue == null ? null : geoPointValue.toJson(),
        "integerValue": integerValue == null ? null : integerValue,
        "mapValue": mapValue == null ? null : mapValue.toJson(),
        "nullValue": nullValue,
        "referenceValue": referenceValue == null ? null : referenceValue,
        "stringValue": stringValue == null ? null : stringValue,
        "timestampValue": timestampValue == null ? null : timestampValue.toIso8601String(),
    };
}

/**
 * A message that can hold any of the supported value types.
 */
class MapValueField {
    MapValueField({
        this.arrayValue,
        this.booleanValue,
        this.bytesValue,
        this.doubleValue,
        this.geoPointValue,
        this.integerValue,
        this.mapValue,
        this.nullValue,
        this.referenceValue,
        this.stringValue,
        this.timestampValue,
    });

    ArrayValue arrayValue;
    bool booleanValue;
    String bytesValue;
    double doubleValue;
    GeoPointValue geoPointValue;
    int integerValue;
    MapValue mapValue;
    dynamic nullValue;
    String referenceValue;
    String stringValue;
    DateTime timestampValue;

    factory MapValueField.fromJson(Map<String, dynamic> json) => MapValueField(
        arrayValue: json["arrayValue"] == null ? null : ArrayValue.fromJson(json["arrayValue"]),
        booleanValue: json["booleanValue"] == null ? null : json["booleanValue"],
        bytesValue: json["bytesValue"] == null ? null : json["bytesValue"],
        doubleValue: json["doubleValue"] == null ? null : json["doubleValue"].toDouble(),
        geoPointValue: json["geoPointValue"] == null ? null : GeoPointValue.fromJson(json["geoPointValue"]),
        integerValue: json["integerValue"] == null ? null : json["integerValue"],
        mapValue: json["mapValue"] == null ? null : MapValue.fromJson(json["mapValue"]),
        nullValue: json["nullValue"],
        referenceValue: json["referenceValue"] == null ? null : json["referenceValue"],
        stringValue: json["stringValue"] == null ? null : json["stringValue"],
        timestampValue: json["timestampValue"] == null ? null : DateTime.parse(json["timestampValue"]),
    );

    Map<String, dynamic> toJson() => {
        "arrayValue": arrayValue == null ? null : arrayValue.toJson(),
        "booleanValue": booleanValue == null ? null : booleanValue,
        "bytesValue": bytesValue == null ? null : bytesValue,
        "doubleValue": doubleValue == null ? null : doubleValue,
        "geoPointValue": geoPointValue == null ? null : geoPointValue.toJson(),
        "integerValue": integerValue == null ? null : integerValue,
        "mapValue": mapValue == null ? null : mapValue.toJson(),
        "nullValue": nullValue,
        "referenceValue": referenceValue == null ? null : referenceValue,
        "stringValue": stringValue == null ? null : stringValue,
        "timestampValue": timestampValue == null ? null : timestampValue.toIso8601String(),
    };
}

/**
 * A map value.
 */
class MapValue {
    MapValue({
        this.fields,
    });

    Map<String, MapValueField> fields;

    factory MapValue.fromJson(Map<String, dynamic> json) => MapValue(
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, MapValueField>(k, MapValueField.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

/**
 * A message that can hold any of the supported value types.
 */
class ValueElement {
    ValueElement({
        this.arrayValue,
        this.booleanValue,
        this.bytesValue,
        this.doubleValue,
        this.geoPointValue,
        this.integerValue,
        this.mapValue,
        this.nullValue,
        this.referenceValue,
        this.stringValue,
        this.timestampValue,
    });

    ArrayValue arrayValue;
    bool booleanValue;
    String bytesValue;
    double doubleValue;
    GeoPointValue geoPointValue;
    int integerValue;
    MapValue mapValue;
    dynamic nullValue;
    String referenceValue;
    String stringValue;
    DateTime timestampValue;

    factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
        arrayValue: json["arrayValue"] == null ? null : ArrayValue.fromJson(json["arrayValue"]),
        booleanValue: json["booleanValue"] == null ? null : json["booleanValue"],
        bytesValue: json["bytesValue"] == null ? null : json["bytesValue"],
        doubleValue: json["doubleValue"] == null ? null : json["doubleValue"].toDouble(),
        geoPointValue: json["geoPointValue"] == null ? null : GeoPointValue.fromJson(json["geoPointValue"]),
        integerValue: json["integerValue"] == null ? null : json["integerValue"],
        mapValue: json["mapValue"] == null ? null : MapValue.fromJson(json["mapValue"]),
        nullValue: json["nullValue"],
        referenceValue: json["referenceValue"] == null ? null : json["referenceValue"],
        stringValue: json["stringValue"] == null ? null : json["stringValue"],
        timestampValue: json["timestampValue"] == null ? null : DateTime.parse(json["timestampValue"]),
    );

    Map<String, dynamic> toJson() => {
        "arrayValue": arrayValue == null ? null : arrayValue.toJson(),
        "booleanValue": booleanValue == null ? null : booleanValue,
        "bytesValue": bytesValue == null ? null : bytesValue,
        "doubleValue": doubleValue == null ? null : doubleValue,
        "geoPointValue": geoPointValue == null ? null : geoPointValue.toJson(),
        "integerValue": integerValue == null ? null : integerValue,
        "mapValue": mapValue == null ? null : mapValue.toJson(),
        "nullValue": nullValue,
        "referenceValue": referenceValue == null ? null : referenceValue,
        "stringValue": stringValue == null ? null : stringValue,
        "timestampValue": timestampValue == null ? null : timestampValue.toIso8601String(),
    };
}

/**
 * An array value.
 *
 * Cannot directly contain another array value, though can contain an
 * map which contains another array.
 */
class ArrayValue {
    ArrayValue({
        this.values,
    });

    List<ValueElement> values;

    factory ArrayValue.fromJson(Map<String, dynamic> json) => ArrayValue(
        values: json["values"] == null ? null : List<ValueElement>.from(json["values"].map((x) => ValueElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
    };
}

/**
 * A geo point value representing a point on the surface of Earth.
 */
class GeoPointValue {
    GeoPointValue({
        this.latitude,
        this.longitude,
    });

    double latitude;
    double longitude;

    factory GeoPointValue.fromJson(Map<String, dynamic> json) => GeoPointValue(
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
    };
}

enum BytesValue { NULL_VALUE }

final bytesValueValues = EnumValues({
    "NULL_VALUE": BytesValue.NULL_VALUE
});

/**
 * A DocumentMask object that lists changed fields.
 * This is only populated for update events.
 */
class UpdateMask {
    UpdateMask({
        this.fieldPaths,
    });

    List<String> fieldPaths;

    factory UpdateMask.fromJson(Map<String, dynamic> json) => UpdateMask(
        fieldPaths: json["fieldPaths"] == null ? null : List<String>.from(json["fieldPaths"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "fieldPaths": fieldPaths == null ? null : List<dynamic>.from(fieldPaths.map((x) => x)),
    };
}

/**
 * A Document object containing a post-operation document snapshot.
 * This is not populated for delete events. (TODO: check this!)
 *
 * A Document object containing a pre-operation document snapshot.
 * This is only populated for update and delete events.
 *
 * A Firestore document.
 */
class Value {
    Value({
        this.createTime,
        this.fields,
        this.name,
        this.updateTime,
    });

    DateTime createTime;
    Map<String, OldValueField> fields;
    String name;
    DateTime updateTime;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        createTime: json["createTime"] == null ? null : DateTime.parse(json["createTime"]),
        fields: json["fields"] == null ? null : Map.from(json["fields"]).map((k, v) => MapEntry<String, OldValueField>(k, OldValueField.fromJson(v))),
        name: json["name"] == null ? null : json["name"],
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "createTime": createTime == null ? null : createTime.toIso8601String(),
        "fields": fields == null ? null : Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "name": name == null ? null : name,
        "updateTime": updateTime == null ? null : updateTime.toIso8601String(),
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
