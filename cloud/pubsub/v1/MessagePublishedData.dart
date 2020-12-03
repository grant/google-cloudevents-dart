// Copyright 2020 Google LLC
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
 * The event data when a message is published to a topic.
 */
class MessagePublishedData {
    MessagePublishedData({
        this.message,
        this.subscription,
    });

    Message message;
    String subscription;
}

/**
 * The message that was published.
 */
class Message {
    Message({
        this.attributes,
        this.data,
        this.messageId,
    });

    Map<String, String> attributes;
    String data;
    String messageId;
}
