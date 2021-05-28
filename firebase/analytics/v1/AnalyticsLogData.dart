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
//     final analyticsLogData = analyticsLogDataFromJson(jsonString);

import 'dart:convert';

AnalyticsLogData analyticsLogDataFromJson(String str) => AnalyticsLogData.fromJson(json.decode(str));

String analyticsLogDataToJson(AnalyticsLogData data) => json.encode(data.toJson());

/**
 * The data within Firebase Analytics log events.
 */
class AnalyticsLogData {
    AnalyticsLogData({
        this.eventDim,
        this.userDim,
    });

    List<EventDim> eventDim;
    UserDim userDim;

    factory AnalyticsLogData.fromJson(Map<String, dynamic> json) => AnalyticsLogData(
        eventDim: json["eventDim"] == null ? null : List<EventDim>.from(json["eventDim"].map((x) => EventDim.fromJson(x))),
        userDim: json["userDim"] == null ? null : UserDim.fromJson(json["userDim"]),
    );

    Map<String, dynamic> toJson() => {
        "eventDim": eventDim == null ? null : List<dynamic>.from(eventDim.map((x) => x.toJson())),
        "userDim": userDim == null ? null : userDim.toJson(),
    };
}

/**
 * Message containing information pertaining to the event.
 */
class EventDim {
    EventDim({
        this.date,
        this.name,
        this.params,
        this.previousTimestampMicros,
        this.timestampMicros,
        this.valueInUsd,
    });

    String date;
    String name;
    Map<String, AnalyticsValue> params;
    int previousTimestampMicros;
    int timestampMicros;
    double valueInUsd;

    factory EventDim.fromJson(Map<String, dynamic> json) => EventDim(
        date: json["date"] == null ? null : json["date"],
        name: json["name"] == null ? null : json["name"],
        params: json["params"] == null ? null : Map.from(json["params"]).map((k, v) => MapEntry<String, AnalyticsValue>(k, AnalyticsValue.fromJson(v))),
        previousTimestampMicros: json["previousTimestampMicros"] == null ? null : json["previousTimestampMicros"],
        timestampMicros: json["timestampMicros"] == null ? null : json["timestampMicros"],
        valueInUsd: json["valueInUsd"] == null ? null : json["valueInUsd"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "name": name == null ? null : name,
        "params": params == null ? null : Map.from(params).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "previousTimestampMicros": previousTimestampMicros == null ? null : previousTimestampMicros,
        "timestampMicros": timestampMicros == null ? null : timestampMicros,
        "valueInUsd": valueInUsd == null ? null : valueInUsd,
    };
}

/**
 * Value for Event Params and UserProperty can be of type string or int or
 * float or double.
 */
class AnalyticsValue {
    AnalyticsValue({
        this.doubleValue,
        this.floatValue,
        this.intValue,
        this.stringValue,
    });

    double doubleValue;
    double floatValue;
    int intValue;
    String stringValue;

    factory AnalyticsValue.fromJson(Map<String, dynamic> json) => AnalyticsValue(
        doubleValue: json["doubleValue"] == null ? null : json["doubleValue"].toDouble(),
        floatValue: json["floatValue"] == null ? null : json["floatValue"].toDouble(),
        intValue: json["intValue"] == null ? null : json["intValue"],
        stringValue: json["stringValue"] == null ? null : json["stringValue"],
    );

    Map<String, dynamic> toJson() => {
        "doubleValue": doubleValue == null ? null : doubleValue,
        "floatValue": floatValue == null ? null : floatValue,
        "intValue": intValue == null ? null : intValue,
        "stringValue": stringValue == null ? null : stringValue,
    };
}

/**
 * User related dimensions.
 */
class UserDim {
    UserDim({
        this.appInfo,
        this.bundleInfo,
        this.deviceInfo,
        this.firstOpenTimestampMicros,
        this.geoInfo,
        this.ltvInfo,
        this.trafficSource,
        this.userId,
        this.userProperties,
    });

    AppInfo appInfo;
    BundleInfo bundleInfo;
    DeviceInfo deviceInfo;
    int firstOpenTimestampMicros;
    GeoInfo geoInfo;
    LtvInfo ltvInfo;
    TrafficSource trafficSource;
    String userId;
    Map<String, UserProperty> userProperties;

    factory UserDim.fromJson(Map<String, dynamic> json) => UserDim(
        appInfo: json["appInfo"] == null ? null : AppInfo.fromJson(json["appInfo"]),
        bundleInfo: json["bundleInfo"] == null ? null : BundleInfo.fromJson(json["bundleInfo"]),
        deviceInfo: json["deviceInfo"] == null ? null : DeviceInfo.fromJson(json["deviceInfo"]),
        firstOpenTimestampMicros: json["firstOpenTimestampMicros"] == null ? null : json["firstOpenTimestampMicros"],
        geoInfo: json["geoInfo"] == null ? null : GeoInfo.fromJson(json["geoInfo"]),
        ltvInfo: json["ltvInfo"] == null ? null : LtvInfo.fromJson(json["ltvInfo"]),
        trafficSource: json["trafficSource"] == null ? null : TrafficSource.fromJson(json["trafficSource"]),
        userId: json["userId"] == null ? null : json["userId"],
        userProperties: json["userProperties"] == null ? null : Map.from(json["userProperties"]).map((k, v) => MapEntry<String, UserProperty>(k, UserProperty.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "appInfo": appInfo == null ? null : appInfo.toJson(),
        "bundleInfo": bundleInfo == null ? null : bundleInfo.toJson(),
        "deviceInfo": deviceInfo == null ? null : deviceInfo.toJson(),
        "firstOpenTimestampMicros": firstOpenTimestampMicros == null ? null : firstOpenTimestampMicros,
        "geoInfo": geoInfo == null ? null : geoInfo.toJson(),
        "ltvInfo": ltvInfo == null ? null : ltvInfo.toJson(),
        "trafficSource": trafficSource == null ? null : trafficSource.toJson(),
        "userId": userId == null ? null : userId,
        "userProperties": userProperties == null ? null : Map.from(userProperties).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

/**
 * App information.
 */
class AppInfo {
    AppInfo({
        this.appId,
        this.appInstanceId,
        this.appPlatform,
        this.appStore,
        this.appVersion,
    });

    String appId;
    String appInstanceId;
    String appPlatform;
    String appStore;
    String appVersion;

    factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        appId: json["appId"] == null ? null : json["appId"],
        appInstanceId: json["appInstanceId"] == null ? null : json["appInstanceId"],
        appPlatform: json["appPlatform"] == null ? null : json["appPlatform"],
        appStore: json["appStore"] == null ? null : json["appStore"],
        appVersion: json["appVersion"] == null ? null : json["appVersion"],
    );

    Map<String, dynamic> toJson() => {
        "appId": appId == null ? null : appId,
        "appInstanceId": appInstanceId == null ? null : appInstanceId,
        "appPlatform": appPlatform == null ? null : appPlatform,
        "appStore": appStore == null ? null : appStore,
        "appVersion": appVersion == null ? null : appVersion,
    };
}

/**
 * Information regarding the bundle in which these events were uploaded.
 */
class BundleInfo {
    BundleInfo({
        this.bundleSequenceId,
        this.serverTimestampOffsetMicros,
    });

    int bundleSequenceId;
    int serverTimestampOffsetMicros;

    factory BundleInfo.fromJson(Map<String, dynamic> json) => BundleInfo(
        bundleSequenceId: json["bundleSequenceId"] == null ? null : json["bundleSequenceId"],
        serverTimestampOffsetMicros: json["serverTimestampOffsetMicros"] == null ? null : json["serverTimestampOffsetMicros"],
    );

    Map<String, dynamic> toJson() => {
        "bundleSequenceId": bundleSequenceId == null ? null : bundleSequenceId,
        "serverTimestampOffsetMicros": serverTimestampOffsetMicros == null ? null : serverTimestampOffsetMicros,
    };
}

/**
 * Device information.
 */
class DeviceInfo {
    DeviceInfo({
        this.deviceCategory,
        this.deviceId,
        this.deviceModel,
        this.deviceTimeZoneOffsetSeconds,
        this.limitedAdTracking,
        this.mobileBrandName,
        this.mobileMarketingName,
        this.mobileModelName,
        this.platformVersion,
        this.resettableDeviceId,
        this.userDefaultLanguage,
    });

    String deviceCategory;
    String deviceId;
    String deviceModel;
    int deviceTimeZoneOffsetSeconds;
    bool limitedAdTracking;
    String mobileBrandName;
    String mobileMarketingName;
    String mobileModelName;
    String platformVersion;
    String resettableDeviceId;
    String userDefaultLanguage;

    factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
        deviceCategory: json["deviceCategory"] == null ? null : json["deviceCategory"],
        deviceId: json["deviceId"] == null ? null : json["deviceId"],
        deviceModel: json["deviceModel"] == null ? null : json["deviceModel"],
        deviceTimeZoneOffsetSeconds: json["deviceTimeZoneOffsetSeconds"] == null ? null : json["deviceTimeZoneOffsetSeconds"],
        limitedAdTracking: json["limitedAdTracking"] == null ? null : json["limitedAdTracking"],
        mobileBrandName: json["mobileBrandName"] == null ? null : json["mobileBrandName"],
        mobileMarketingName: json["mobileMarketingName"] == null ? null : json["mobileMarketingName"],
        mobileModelName: json["mobileModelName"] == null ? null : json["mobileModelName"],
        platformVersion: json["platformVersion"] == null ? null : json["platformVersion"],
        resettableDeviceId: json["resettableDeviceId"] == null ? null : json["resettableDeviceId"],
        userDefaultLanguage: json["userDefaultLanguage"] == null ? null : json["userDefaultLanguage"],
    );

    Map<String, dynamic> toJson() => {
        "deviceCategory": deviceCategory == null ? null : deviceCategory,
        "deviceId": deviceId == null ? null : deviceId,
        "deviceModel": deviceModel == null ? null : deviceModel,
        "deviceTimeZoneOffsetSeconds": deviceTimeZoneOffsetSeconds == null ? null : deviceTimeZoneOffsetSeconds,
        "limitedAdTracking": limitedAdTracking == null ? null : limitedAdTracking,
        "mobileBrandName": mobileBrandName == null ? null : mobileBrandName,
        "mobileMarketingName": mobileMarketingName == null ? null : mobileMarketingName,
        "mobileModelName": mobileModelName == null ? null : mobileModelName,
        "platformVersion": platformVersion == null ? null : platformVersion,
        "resettableDeviceId": resettableDeviceId == null ? null : resettableDeviceId,
        "userDefaultLanguage": userDefaultLanguage == null ? null : userDefaultLanguage,
    };
}

/**
 * User's geographic information.
 */
class GeoInfo {
    GeoInfo({
        this.city,
        this.continent,
        this.country,
        this.region,
    });

    String city;
    String continent;
    String country;
    String region;

    factory GeoInfo.fromJson(Map<String, dynamic> json) => GeoInfo(
        city: json["city"] == null ? null : json["city"],
        continent: json["continent"] == null ? null : json["continent"],
        country: json["country"] == null ? null : json["country"],
        region: json["region"] == null ? null : json["region"],
    );

    Map<String, dynamic> toJson() => {
        "city": city == null ? null : city,
        "continent": continent == null ? null : continent,
        "country": country == null ? null : country,
        "region": region == null ? null : region,
    };
}

/**
 * Lifetime Value information about this user.
 */
class LtvInfo {
    LtvInfo({
        this.currency,
        this.revenue,
    });

    String currency;
    double revenue;

    factory LtvInfo.fromJson(Map<String, dynamic> json) => LtvInfo(
        currency: json["currency"] == null ? null : json["currency"],
        revenue: json["revenue"] == null ? null : json["revenue"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency == null ? null : currency,
        "revenue": revenue == null ? null : revenue,
    };
}

/**
 * Information about marketing campaign which acquired the user.
 */
class TrafficSource {
    TrafficSource({
        this.userAcquiredCampaign,
        this.userAcquiredMedium,
        this.userAcquiredSource,
    });

    String userAcquiredCampaign;
    String userAcquiredMedium;
    String userAcquiredSource;

    factory TrafficSource.fromJson(Map<String, dynamic> json) => TrafficSource(
        userAcquiredCampaign: json["userAcquiredCampaign"] == null ? null : json["userAcquiredCampaign"],
        userAcquiredMedium: json["userAcquiredMedium"] == null ? null : json["userAcquiredMedium"],
        userAcquiredSource: json["userAcquiredSource"] == null ? null : json["userAcquiredSource"],
    );

    Map<String, dynamic> toJson() => {
        "userAcquiredCampaign": userAcquiredCampaign == null ? null : userAcquiredCampaign,
        "userAcquiredMedium": userAcquiredMedium == null ? null : userAcquiredMedium,
        "userAcquiredSource": userAcquiredSource == null ? null : userAcquiredSource,
    };
}

class UserProperty {
    UserProperty({
        this.index,
        this.setTimestampUsec,
        this.value,
    });

    int index;
    int setTimestampUsec;
    Value value;

    factory UserProperty.fromJson(Map<String, dynamic> json) => UserProperty(
        index: json["index"] == null ? null : json["index"],
        setTimestampUsec: json["setTimestampUsec"] == null ? null : json["setTimestampUsec"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
    );

    Map<String, dynamic> toJson() => {
        "index": index == null ? null : index,
        "setTimestampUsec": setTimestampUsec == null ? null : setTimestampUsec,
        "value": value == null ? null : value.toJson(),
    };
}

/**
 * Last set value of user property.
 *
 * Value for Event Params and UserProperty can be of type string or int or
 * float or double.
 */
class Value {
    Value({
        this.doubleValue,
        this.floatValue,
        this.intValue,
        this.stringValue,
    });

    double doubleValue;
    double floatValue;
    int intValue;
    String stringValue;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        doubleValue: json["doubleValue"] == null ? null : json["doubleValue"].toDouble(),
        floatValue: json["floatValue"] == null ? null : json["floatValue"].toDouble(),
        intValue: json["intValue"] == null ? null : json["intValue"],
        stringValue: json["stringValue"] == null ? null : json["stringValue"],
    );

    Map<String, dynamic> toJson() => {
        "doubleValue": doubleValue == null ? null : doubleValue,
        "floatValue": floatValue == null ? null : floatValue,
        "intValue": intValue == null ? null : intValue,
        "stringValue": stringValue == null ? null : stringValue,
    };
}
