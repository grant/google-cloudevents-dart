# google-cloudevents-dart
Testing if a Dart event client is useful

Gen with the `qt` tool, after installing it in the main `google-cloudevents` repo:

```
qt \
--in=$(dirname $PWD)/google-cloudevents/jsonschema \
--out=$PWD \
--l=dart
```