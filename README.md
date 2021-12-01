# chat_poc

Note that to get Stream to run, we needed to set:
- `ext.kotlin_version = '1.4.32'` in _android/build.gradle_
- `multiDexEnabled true` in _android/app/build.gradle_ to `defaultConfig`
- `implementation 'com.android.support:multidex:1.0.3'` in _android/app/build.gradle_ to `dependencies`
