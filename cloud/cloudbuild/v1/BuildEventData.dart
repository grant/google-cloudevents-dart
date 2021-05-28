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
}

enum LogStreamingOptionEnum { STREAM_DEFAULT, STREAM_ON, STREAM_OFF }

enum LoggingEnum { LOGGING_UNSPECIFIED, LEGACY, GCS_ONLY }

enum MachineTypeEnum { UNSPECIFIED, N1_HIGHCPU_8, N1_HIGHCPU_32 }

enum RequestedVerifyOptionEnum { NOT_VERIFIED, VERIFIED }

enum SourceProvenanceHashEnum { NONE, SHA256, MD5 }

enum SubstitutionOptionEnum { MUST_MATCH, ALLOW_LOOSE }

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
}

class FileHashValue {
    FileHashValue({
        this.fileHash,
    });

    List<FileHashElement> fileHash;
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
}

enum StatusEnum { STATUS_UNKNOWN, QUEUED, WORKING, SUCCESS, FAILURE, INTERNAL_ERROR, TIMEOUT, CANCELLED, EXPIRED }

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
}
