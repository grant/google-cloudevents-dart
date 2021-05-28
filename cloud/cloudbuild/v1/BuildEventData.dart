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
//     final buildEventData = buildEventDataFromJson(jsonString);

import 'dart:convert';

BuildEventData buildEventDataFromJson(String str) => BuildEventData.fromJson(json.decode(str));

String buildEventDataToJson(BuildEventData data) => json.encode(data.toJson());

/**
 * Build event data for Google Cloud Platform API operations.
 */
class BuildEventData {
    BuildEventData({
        this.artifacts,
        this.buildTriggerId,
        this.createTime,
        this.finishTime,
        this.id,
        this.images,
        this.logsBucket,
        this.logUrl,
        this.options,
        this.projectId,
        this.queueTtl,
        this.results,
        this.secrets,
        this.source,
        this.sourceProvenance,
        this.startTime,
        this.status,
        this.statusDetail,
        this.steps,
        this.substitutions,
        this.tags,
        this.timeout,
        this.timing,
    });

    Artifacts artifacts;
    String buildTriggerId;
    DateTime createTime;
    DateTime finishTime;
    String id;
    List<String> images;
    String logsBucket;
    String logUrl;
    Options options;
    String projectId;
    QueueTtl queueTtl;
    Results results;
    List<Secret> secrets;
    Source source;
    SourceProvenance sourceProvenance;
    DateTime startTime;
    dynamic status;
    String statusDetail;
    List<Step> steps;
    Map<String, String> substitutions;
    List<String> tags;
    BuildEventDataTimeout timeout;
    Map<String, TimeSpan> timing;

    factory BuildEventData.fromJson(Map<String, dynamic> json) => BuildEventData(
        artifacts: json["artifacts"] == null ? null : Artifacts.fromJson(json["artifacts"]),
        buildTriggerId: json["buildTriggerId"] == null ? null : json["buildTriggerId"],
        createTime: json["createTime"] == null ? null : DateTime.parse(json["createTime"]),
        finishTime: json["finishTime"] == null ? null : DateTime.parse(json["finishTime"]),
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
        logsBucket: json["logsBucket"] == null ? null : json["logsBucket"],
        logUrl: json["logUrl"] == null ? null : json["logUrl"],
        options: json["options"] == null ? null : Options.fromJson(json["options"]),
        projectId: json["projectId"] == null ? null : json["projectId"],
        queueTtl: json["queueTtl"] == null ? null : QueueTtl.fromJson(json["queueTtl"]),
        results: json["results"] == null ? null : Results.fromJson(json["results"]),
        secrets: json["secrets"] == null ? null : List<Secret>.from(json["secrets"].map((x) => Secret.fromJson(x))),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        sourceProvenance: json["sourceProvenance"] == null ? null : SourceProvenance.fromJson(json["sourceProvenance"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        status: json["status"],
        statusDetail: json["statusDetail"] == null ? null : json["statusDetail"],
        steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        substitutions: json["substitutions"] == null ? null : Map.from(json["substitutions"]).map((k, v) => MapEntry<String, String>(k, v)),
        tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
        timeout: json["timeout"] == null ? null : BuildEventDataTimeout.fromJson(json["timeout"]),
        timing: json["timing"] == null ? null : Map.from(json["timing"]).map((k, v) => MapEntry<String, TimeSpan>(k, TimeSpan.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "artifacts": artifacts == null ? null : artifacts.toJson(),
        "buildTriggerId": buildTriggerId == null ? null : buildTriggerId,
        "createTime": createTime == null ? null : createTime.toIso8601String(),
        "finishTime": finishTime == null ? null : finishTime.toIso8601String(),
        "id": id == null ? null : id,
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "logsBucket": logsBucket == null ? null : logsBucket,
        "logUrl": logUrl == null ? null : logUrl,
        "options": options == null ? null : options.toJson(),
        "projectId": projectId == null ? null : projectId,
        "queueTtl": queueTtl == null ? null : queueTtl.toJson(),
        "results": results == null ? null : results.toJson(),
        "secrets": secrets == null ? null : List<dynamic>.from(secrets.map((x) => x.toJson())),
        "source": source == null ? null : source.toJson(),
        "sourceProvenance": sourceProvenance == null ? null : sourceProvenance.toJson(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
        "status": status,
        "statusDetail": statusDetail == null ? null : statusDetail,
        "steps": steps == null ? null : List<dynamic>.from(steps.map((x) => x.toJson())),
        "substitutions": substitutions == null ? null : Map.from(substitutions).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "timeout": timeout == null ? null : timeout.toJson(),
        "timing": timing == null ? null : Map.from(timing).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

/**
 * Artifacts produced by the build that should be uploaded upon
 * successful completion of all build steps.
 */
class Artifacts {
    Artifacts({
        this.images,
        this.objects,
    });

    List<String> images;
    Objects objects;

    factory Artifacts.fromJson(Map<String, dynamic> json) => Artifacts(
        images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
        objects: json["objects"] == null ? null : Objects.fromJson(json["objects"]),
    );

    Map<String, dynamic> toJson() => {
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "objects": objects == null ? null : objects.toJson(),
    };
}

/**
 * A list of objects to be uploaded to Cloud Storage upon successful
 * completion of all build steps.
 *
 * Files in the workspace matching specified paths globs will be uploaded to
 * the specified Cloud Storage location using the builder service account's
 * credentials.
 *
 * The location and generation of the uploaded objects will be stored in the
 * Build resource's results field.
 *
 * If any objects fail to be pushed, the build is marked FAILURE.
 */
class Objects {
    Objects({
        this.location,
        this.paths,
        this.timing,
    });

    String location;
    List<String> paths;
    ObjectsTiming timing;

    factory Objects.fromJson(Map<String, dynamic> json) => Objects(
        location: json["location"] == null ? null : json["location"],
        paths: json["paths"] == null ? null : List<String>.from(json["paths"].map((x) => x)),
        timing: json["timing"] == null ? null : ObjectsTiming.fromJson(json["timing"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location,
        "paths": paths == null ? null : List<dynamic>.from(paths.map((x) => x)),
        "timing": timing == null ? null : timing.toJson(),
    };
}

/**
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class ObjectsTiming {
    ObjectsTiming({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory ObjectsTiming.fromJson(Map<String, dynamic> json) => ObjectsTiming(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
    };
}

/**
 * Special options for this build.
 */
class Options {
    Options({
        this.diskSizeGb,
        this.env,
        this.logging,
        this.logStreamingOption,
        this.machineType,
        this.requestedVerifyOption,
        this.secretEnv,
        this.sourceProvenanceHash,
        this.substitutionOption,
        this.volumes,
        this.workerPool,
    });

    int diskSizeGb;
    List<String> env;
    dynamic logging;
    dynamic logStreamingOption;
    dynamic machineType;
    dynamic requestedVerifyOption;
    List<String> secretEnv;
    List<dynamic> sourceProvenanceHash;
    dynamic substitutionOption;
    List<Volume> volumes;
    String workerPool;

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        diskSizeGb: json["diskSizeGb"] == null ? null : json["diskSizeGb"],
        env: json["env"] == null ? null : List<String>.from(json["env"].map((x) => x)),
        logging: json["logging"],
        logStreamingOption: json["logStreamingOption"],
        machineType: json["machineType"],
        requestedVerifyOption: json["requestedVerifyOption"],
        secretEnv: json["secretEnv"] == null ? null : List<String>.from(json["secretEnv"].map((x) => x)),
        sourceProvenanceHash: json["sourceProvenanceHash"] == null ? null : List<dynamic>.from(json["sourceProvenanceHash"].map((x) => x)),
        substitutionOption: json["substitutionOption"],
        volumes: json["volumes"] == null ? null : List<Volume>.from(json["volumes"].map((x) => Volume.fromJson(x))),
        workerPool: json["workerPool"] == null ? null : json["workerPool"],
    );

    Map<String, dynamic> toJson() => {
        "diskSizeGb": diskSizeGb == null ? null : diskSizeGb,
        "env": env == null ? null : List<dynamic>.from(env.map((x) => x)),
        "logging": logging,
        "logStreamingOption": logStreamingOption,
        "machineType": machineType,
        "requestedVerifyOption": requestedVerifyOption,
        "secretEnv": secretEnv == null ? null : List<dynamic>.from(secretEnv.map((x) => x)),
        "sourceProvenanceHash": sourceProvenanceHash == null ? null : List<dynamic>.from(sourceProvenanceHash.map((x) => x)),
        "substitutionOption": substitutionOption,
        "volumes": volumes == null ? null : List<dynamic>.from(volumes.map((x) => x.toJson())),
        "workerPool": workerPool == null ? null : workerPool,
    };
}

enum LogStreamingOptionEnum { STREAM_DEFAULT, STREAM_ON, STREAM_OFF }

final logStreamingOptionEnumValues = EnumValues({
    "STREAM_DEFAULT": LogStreamingOptionEnum.STREAM_DEFAULT,
    "STREAM_OFF": LogStreamingOptionEnum.STREAM_OFF,
    "STREAM_ON": LogStreamingOptionEnum.STREAM_ON
});

enum LoggingEnum { LOGGING_UNSPECIFIED, LEGACY, GCS_ONLY }

final loggingEnumValues = EnumValues({
    "GCS_ONLY": LoggingEnum.GCS_ONLY,
    "LEGACY": LoggingEnum.LEGACY,
    "LOGGING_UNSPECIFIED": LoggingEnum.LOGGING_UNSPECIFIED
});

enum MachineTypeEnum { UNSPECIFIED, N1_HIGHCPU_8, N1_HIGHCPU_32 }

final machineTypeEnumValues = EnumValues({
    "N1_HIGHCPU_32": MachineTypeEnum.N1_HIGHCPU_32,
    "N1_HIGHCPU_8": MachineTypeEnum.N1_HIGHCPU_8,
    "UNSPECIFIED": MachineTypeEnum.UNSPECIFIED
});

enum RequestedVerifyOptionEnum { NOT_VERIFIED, VERIFIED }

final requestedVerifyOptionEnumValues = EnumValues({
    "NOT_VERIFIED": RequestedVerifyOptionEnum.NOT_VERIFIED,
    "VERIFIED": RequestedVerifyOptionEnum.VERIFIED
});

enum SourceProvenanceHashEnum { NONE, SHA256, MD5 }

final sourceProvenanceHashEnumValues = EnumValues({
    "MD5": SourceProvenanceHashEnum.MD5,
    "NONE": SourceProvenanceHashEnum.NONE,
    "SHA256": SourceProvenanceHashEnum.SHA256
});

enum SubstitutionOptionEnum { MUST_MATCH, ALLOW_LOOSE }

final substitutionOptionEnumValues = EnumValues({
    "ALLOW_LOOSE": SubstitutionOptionEnum.ALLOW_LOOSE,
    "MUST_MATCH": SubstitutionOptionEnum.MUST_MATCH
});

/**
 * Volume describes a Docker container volume which is mounted into build steps
 * in order to persist files across build step execution.
 */
class Volume {
    Volume({
        this.name,
        this.path,
    });

    String name;
    String path;

    factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        name: json["name"] == null ? null : json["name"],
        path: json["path"] == null ? null : json["path"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "path": path == null ? null : path,
    };
}

/**
 * TTL in queue for this build. If provided and the build is enqueued longer
 * than this value, the build will expire and the build status will be
 * `EXPIRED`.
 *
 * The TTL starts ticking from create_time.
 */
class QueueTtl {
    QueueTtl({
        this.nanos,
        this.seconds,
    });

    int nanos;
    int seconds;

    factory QueueTtl.fromJson(Map<String, dynamic> json) => QueueTtl(
        nanos: json["nanos"] == null ? null : json["nanos"],
        seconds: json["seconds"] == null ? null : json["seconds"],
    );

    Map<String, dynamic> toJson() => {
        "nanos": nanos == null ? null : nanos,
        "seconds": seconds == null ? null : seconds,
    };
}

/**
 * Results of the build.
 */
class Results {
    Results({
        this.artifactManifest,
        this.artifactTiming,
        this.buildStepImages,
        this.buildStepOutputs,
        this.images,
        this.numArtifacts,
    });

    String artifactManifest;
    ArtifactTiming artifactTiming;
    List<String> buildStepImages;
    List<String> buildStepOutputs;
    List<Image> images;
    int numArtifacts;

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        artifactManifest: json["artifactManifest"] == null ? null : json["artifactManifest"],
        artifactTiming: json["artifactTiming"] == null ? null : ArtifactTiming.fromJson(json["artifactTiming"]),
        buildStepImages: json["buildStepImages"] == null ? null : List<String>.from(json["buildStepImages"].map((x) => x)),
        buildStepOutputs: json["buildStepOutputs"] == null ? null : List<String>.from(json["buildStepOutputs"].map((x) => x)),
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        numArtifacts: json["numArtifacts"] == null ? null : json["numArtifacts"],
    );

    Map<String, dynamic> toJson() => {
        "artifactManifest": artifactManifest == null ? null : artifactManifest,
        "artifactTiming": artifactTiming == null ? null : artifactTiming.toJson(),
        "buildStepImages": buildStepImages == null ? null : List<dynamic>.from(buildStepImages.map((x) => x)),
        "buildStepOutputs": buildStepOutputs == null ? null : List<dynamic>.from(buildStepOutputs.map((x) => x)),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "numArtifacts": numArtifacts == null ? null : numArtifacts,
    };
}

/**
 * Time to push all non-container artifacts.
 *
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class ArtifactTiming {
    ArtifactTiming({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory ArtifactTiming.fromJson(Map<String, dynamic> json) => ArtifactTiming(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
    };
}

/**
 * An image built by the pipeline.
 */
class Image {
    Image({
        this.digest,
        this.name,
        this.pushTiming,
    });

    String digest;
    String name;
    PushTiming pushTiming;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        digest: json["digest"] == null ? null : json["digest"],
        name: json["name"] == null ? null : json["name"],
        pushTiming: json["pushTiming"] == null ? null : PushTiming.fromJson(json["pushTiming"]),
    );

    Map<String, dynamic> toJson() => {
        "digest": digest == null ? null : digest,
        "name": name == null ? null : name,
        "pushTiming": pushTiming == null ? null : pushTiming.toJson(),
    };
}

/**
 * Stores timing information for pushing the specified image.
 *
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class PushTiming {
    PushTiming({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory PushTiming.fromJson(Map<String, dynamic> json) => PushTiming(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
    };
}

/**
 * Pairs a set of secret environment variables containing encrypted
 * values with the Cloud KMS key to use to decrypt the value.
 */
class Secret {
    Secret({
        this.kmsKeyName,
        this.secretEnv,
    });

    String kmsKeyName;
    Map<String, String> secretEnv;

    factory Secret.fromJson(Map<String, dynamic> json) => Secret(
        kmsKeyName: json["kmsKeyName"] == null ? null : json["kmsKeyName"],
        secretEnv: json["secretEnv"] == null ? null : Map.from(json["secretEnv"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "kmsKeyName": kmsKeyName == null ? null : kmsKeyName,
        "secretEnv": secretEnv == null ? null : Map.from(secretEnv).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

/**
 * The location of the source files to build.
 */
class Source {
    Source({
        this.repoSource,
        this.storageSource,
    });

    RepoSourceClass repoSource;
    StorageSourceClass storageSource;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        repoSource: json["repoSource"] == null ? null : RepoSourceClass.fromJson(json["repoSource"]),
        storageSource: json["storageSource"] == null ? null : StorageSourceClass.fromJson(json["storageSource"]),
    );

    Map<String, dynamic> toJson() => {
        "repoSource": repoSource == null ? null : repoSource.toJson(),
        "storageSource": storageSource == null ? null : storageSource.toJson(),
    };
}

/**
 * If provided, get the source from this location in a Cloud Source
 * Repository.
 *
 * Location of the source in a Google Cloud Source Repository.
 */
class RepoSourceClass {
    RepoSourceClass({
        this.branchName,
        this.commitSha,
        this.dir,
        this.invertRegex,
        this.projectId,
        this.repoName,
        this.substitutions,
        this.tagName,
    });

    String branchName;
    String commitSha;
    String dir;
    bool invertRegex;
    String projectId;
    String repoName;
    Map<String, String> substitutions;
    String tagName;

    factory RepoSourceClass.fromJson(Map<String, dynamic> json) => RepoSourceClass(
        branchName: json["branchName"] == null ? null : json["branchName"],
        commitSha: json["commitSha"] == null ? null : json["commitSha"],
        dir: json["dir"] == null ? null : json["dir"],
        invertRegex: json["invertRegex"] == null ? null : json["invertRegex"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        repoName: json["repoName"] == null ? null : json["repoName"],
        substitutions: json["substitutions"] == null ? null : Map.from(json["substitutions"]).map((k, v) => MapEntry<String, String>(k, v)),
        tagName: json["tagName"] == null ? null : json["tagName"],
    );

    Map<String, dynamic> toJson() => {
        "branchName": branchName == null ? null : branchName,
        "commitSha": commitSha == null ? null : commitSha,
        "dir": dir == null ? null : dir,
        "invertRegex": invertRegex == null ? null : invertRegex,
        "projectId": projectId == null ? null : projectId,
        "repoName": repoName == null ? null : repoName,
        "substitutions": substitutions == null ? null : Map.from(substitutions).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "tagName": tagName == null ? null : tagName,
    };
}

/**
 * If provided, get the source from this location in Google Cloud Storage.
 *
 * Location of the source in an archive file in Google Cloud Storage.
 */
class StorageSourceClass {
    StorageSourceClass({
        this.bucket,
        this.generation,
        this.object,
    });

    String bucket;
    int generation;
    String object;

    factory StorageSourceClass.fromJson(Map<String, dynamic> json) => StorageSourceClass(
        bucket: json["bucket"] == null ? null : json["bucket"],
        generation: json["generation"] == null ? null : json["generation"],
        object: json["object"] == null ? null : json["object"],
    );

    Map<String, dynamic> toJson() => {
        "bucket": bucket == null ? null : bucket,
        "generation": generation == null ? null : generation,
        "object": object == null ? null : object,
    };
}

/**
 * A permanent fixed identifier for source.
 */
class SourceProvenance {
    SourceProvenance({
        this.fileHashes,
        this.resolvedRepoSource,
        this.resolvedStorageSource,
    });

    Map<String, FileHashValue> fileHashes;
    ResolvedRepoSourceClass resolvedRepoSource;
    ResolvedStorageSourceClass resolvedStorageSource;

    factory SourceProvenance.fromJson(Map<String, dynamic> json) => SourceProvenance(
        fileHashes: json["fileHashes"] == null ? null : Map.from(json["fileHashes"]).map((k, v) => MapEntry<String, FileHashValue>(k, FileHashValue.fromJson(v))),
        resolvedRepoSource: json["resolvedRepoSource"] == null ? null : ResolvedRepoSourceClass.fromJson(json["resolvedRepoSource"]),
        resolvedStorageSource: json["resolvedStorageSource"] == null ? null : ResolvedStorageSourceClass.fromJson(json["resolvedStorageSource"]),
    );

    Map<String, dynamic> toJson() => {
        "fileHashes": fileHashes == null ? null : Map.from(fileHashes).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "resolvedRepoSource": resolvedRepoSource == null ? null : resolvedRepoSource.toJson(),
        "resolvedStorageSource": resolvedStorageSource == null ? null : resolvedStorageSource.toJson(),
    };
}

class FileHashValue {
    FileHashValue({
        this.fileHash,
    });

    List<FileHashElement> fileHash;

    factory FileHashValue.fromJson(Map<String, dynamic> json) => FileHashValue(
        fileHash: json["fileHash"] == null ? null : List<FileHashElement>.from(json["fileHash"].map((x) => FileHashElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fileHash": fileHash == null ? null : List<dynamic>.from(fileHash.map((x) => x.toJson())),
    };
}

/**
 * Container message for hash values.
 */
class FileHashElement {
    FileHashElement({
        this.type,
        this.value,
    });

    dynamic type;
    String value;

    factory FileHashElement.fromJson(Map<String, dynamic> json) => FileHashElement(
        type: json["type"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value == null ? null : value,
    };
}

/**
 * A copy of the build's `source.repo_source`, if exists, with any
 * revisions resolved.
 *
 * If provided, get the source from this location in a Cloud Source
 * Repository.
 *
 * Location of the source in a Google Cloud Source Repository.
 */
class ResolvedRepoSourceClass {
    ResolvedRepoSourceClass({
        this.branchName,
        this.commitSha,
        this.dir,
        this.invertRegex,
        this.projectId,
        this.repoName,
        this.substitutions,
        this.tagName,
    });

    String branchName;
    String commitSha;
    String dir;
    bool invertRegex;
    String projectId;
    String repoName;
    Map<String, String> substitutions;
    String tagName;

    factory ResolvedRepoSourceClass.fromJson(Map<String, dynamic> json) => ResolvedRepoSourceClass(
        branchName: json["branchName"] == null ? null : json["branchName"],
        commitSha: json["commitSha"] == null ? null : json["commitSha"],
        dir: json["dir"] == null ? null : json["dir"],
        invertRegex: json["invertRegex"] == null ? null : json["invertRegex"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        repoName: json["repoName"] == null ? null : json["repoName"],
        substitutions: json["substitutions"] == null ? null : Map.from(json["substitutions"]).map((k, v) => MapEntry<String, String>(k, v)),
        tagName: json["tagName"] == null ? null : json["tagName"],
    );

    Map<String, dynamic> toJson() => {
        "branchName": branchName == null ? null : branchName,
        "commitSha": commitSha == null ? null : commitSha,
        "dir": dir == null ? null : dir,
        "invertRegex": invertRegex == null ? null : invertRegex,
        "projectId": projectId == null ? null : projectId,
        "repoName": repoName == null ? null : repoName,
        "substitutions": substitutions == null ? null : Map.from(substitutions).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "tagName": tagName == null ? null : tagName,
    };
}

/**
 * A copy of the build's `source.storage_source`, if exists, with any
 * generations resolved.
 *
 * If provided, get the source from this location in Google Cloud Storage.
 *
 * Location of the source in an archive file in Google Cloud Storage.
 */
class ResolvedStorageSourceClass {
    ResolvedStorageSourceClass({
        this.bucket,
        this.generation,
        this.object,
    });

    String bucket;
    int generation;
    String object;

    factory ResolvedStorageSourceClass.fromJson(Map<String, dynamic> json) => ResolvedStorageSourceClass(
        bucket: json["bucket"] == null ? null : json["bucket"],
        generation: json["generation"] == null ? null : json["generation"],
        object: json["object"] == null ? null : json["object"],
    );

    Map<String, dynamic> toJson() => {
        "bucket": bucket == null ? null : bucket,
        "generation": generation == null ? null : generation,
        "object": object == null ? null : object,
    };
}

enum StatusEnum { STATUS_UNKNOWN, QUEUED, WORKING, SUCCESS, FAILURE, INTERNAL_ERROR, TIMEOUT, CANCELLED, EXPIRED }

final statusEnumValues = EnumValues({
    "CANCELLED": StatusEnum.CANCELLED,
    "EXPIRED": StatusEnum.EXPIRED,
    "FAILURE": StatusEnum.FAILURE,
    "INTERNAL_ERROR": StatusEnum.INTERNAL_ERROR,
    "QUEUED": StatusEnum.QUEUED,
    "STATUS_UNKNOWN": StatusEnum.STATUS_UNKNOWN,
    "SUCCESS": StatusEnum.SUCCESS,
    "TIMEOUT": StatusEnum.TIMEOUT,
    "WORKING": StatusEnum.WORKING
});

/**
 * A step in the build pipeline.
 */
class Step {
    Step({
        this.args,
        this.dir,
        this.entrypoint,
        this.env,
        this.id,
        this.name,
        this.pullTiming,
        this.secretEnv,
        this.status,
        this.timeout,
        this.timing,
        this.volumes,
        this.waitFor,
    });

    List<String> args;
    String dir;
    String entrypoint;
    List<String> env;
    String id;
    String name;
    PullTiming pullTiming;
    List<String> secretEnv;
    dynamic status;
    StepTimeout timeout;
    StepTiming timing;
    List<Volume> volumes;
    List<String> waitFor;

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        args: json["args"] == null ? null : List<String>.from(json["args"].map((x) => x)),
        dir: json["dir"] == null ? null : json["dir"],
        entrypoint: json["entrypoint"] == null ? null : json["entrypoint"],
        env: json["env"] == null ? null : List<String>.from(json["env"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        pullTiming: json["pullTiming"] == null ? null : PullTiming.fromJson(json["pullTiming"]),
        secretEnv: json["secretEnv"] == null ? null : List<String>.from(json["secretEnv"].map((x) => x)),
        status: json["status"],
        timeout: json["timeout"] == null ? null : StepTimeout.fromJson(json["timeout"]),
        timing: json["timing"] == null ? null : StepTiming.fromJson(json["timing"]),
        volumes: json["volumes"] == null ? null : List<Volume>.from(json["volumes"].map((x) => Volume.fromJson(x))),
        waitFor: json["waitFor"] == null ? null : List<String>.from(json["waitFor"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "args": args == null ? null : List<dynamic>.from(args.map((x) => x)),
        "dir": dir == null ? null : dir,
        "entrypoint": entrypoint == null ? null : entrypoint,
        "env": env == null ? null : List<dynamic>.from(env.map((x) => x)),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "pullTiming": pullTiming == null ? null : pullTiming.toJson(),
        "secretEnv": secretEnv == null ? null : List<dynamic>.from(secretEnv.map((x) => x)),
        "status": status,
        "timeout": timeout == null ? null : timeout.toJson(),
        "timing": timing == null ? null : timing.toJson(),
        "volumes": volumes == null ? null : List<dynamic>.from(volumes.map((x) => x.toJson())),
        "waitFor": waitFor == null ? null : List<dynamic>.from(waitFor.map((x) => x)),
    };
}

/**
 * Stores timing information for pulling this build step's
 * builder image only.
 *
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class PullTiming {
    PullTiming({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory PullTiming.fromJson(Map<String, dynamic> json) => PullTiming(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
    };
}

/**
 * Time limit for executing this build step. If not defined, the step has no
 * time limit and will be allowed to continue to run until either it completes
 * or the build itself times out.
 */
class StepTimeout {
    StepTimeout({
        this.nanos,
        this.seconds,
    });

    int nanos;
    int seconds;

    factory StepTimeout.fromJson(Map<String, dynamic> json) => StepTimeout(
        nanos: json["nanos"] == null ? null : json["nanos"],
        seconds: json["seconds"] == null ? null : json["seconds"],
    );

    Map<String, dynamic> toJson() => {
        "nanos": nanos == null ? null : nanos,
        "seconds": seconds == null ? null : seconds,
    };
}

/**
 * Stores timing information for executing this build step.
 *
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class StepTiming {
    StepTiming({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory StepTiming.fromJson(Map<String, dynamic> json) => StepTiming(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
    };
}

/**
 * Amount of time that this build should be allowed to run, to second
 * granularity. If this amount of time elapses, work on the build will cease
 * and the build status will be `TIMEOUT`.
 */
class BuildEventDataTimeout {
    BuildEventDataTimeout({
        this.nanos,
        this.seconds,
    });

    int nanos;
    int seconds;

    factory BuildEventDataTimeout.fromJson(Map<String, dynamic> json) => BuildEventDataTimeout(
        nanos: json["nanos"] == null ? null : json["nanos"],
        seconds: json["seconds"] == null ? null : json["seconds"],
    );

    Map<String, dynamic> toJson() => {
        "nanos": nanos == null ? null : nanos,
        "seconds": seconds == null ? null : seconds,
    };
}

/**
 * Stores timing information for pushing all artifact objects.
 *
 * Start and end times for a build execution phase.
 */
class TimeSpan {
    TimeSpan({
        this.endTime,
        this.startTime,
    });

    DateTime endTime;
    DateTime startTime;

    factory TimeSpan.fromJson(Map<String, dynamic> json) => TimeSpan(
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime.toIso8601String(),
        "startTime": startTime == null ? null : startTime.toIso8601String(),
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
