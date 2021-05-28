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
 * The data within Firebase Analytics log events.
 */
class AnalyticsLogData {
    AnalyticsLogData({
        this.eventDim,
        this.userDim,
    });

    List<EventDim> eventDim;
    UserDim userDim;
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
}
