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
}

/**
 * A map value.
 */
class MapValue {
    MapValue({
        this.fields,
    });

    Map<String, MapValueField> fields;
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
}

enum BytesValue { NULL_VALUE }

/**
 * A DocumentMask object that lists changed fields.
 * This is only populated for update events.
 */
class UpdateMask {
    UpdateMask({
        this.fieldPaths,
    });

    List<String> fieldPaths;
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
}
