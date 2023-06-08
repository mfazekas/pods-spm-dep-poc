This is a POC for Cocoapods spm_dependency.

### Usage:

```sh
cd ObjCUIApp
pod install
```

### What's happening:

1. `ObjCUIApp` uses `ObjCLib` and `ObjCLib` declares `CocoaLumbarjack` as spm dependency.

https://github.com/mfazekas/pods-spm-dep-poc/blob/bf9d551fc8ab6872012a0204529c0f9759af79f8/ObjCLib/ObjCLib.podspec#L44-L48

2. `ObjCUIApp` calls a method declared by `ObjCLib` that logs a message using `CocoaLumerjack`


[RFC] - Swift Package Manager dependency

## Background

Swift Package Manager is becoming the de-facto standard for new libraries, due to it's builtin support in XCode. Cocoapods libraries that want's to consume a SPM package have these choices right now:
- convert their lib to SPM and migrate off CocoaPods
- write a pod spec for the dependency
- ask users to install the SPM manually [?]

## Suggested solution

Introduce SPM dependencies as part of pod spec.

In ruby this could look like:

```ruby
  s.spm_dependency(
    url: 'https://github.com/CocoaLumberjack/CocoaLumberjack.git',
    requirement: {kind: 'upToNextMajorVersion', minimumVersion: '3.8.0'},
    product_name: 'CocoaLumberjack'
  )
```

This would perform the following modifications:
1.) Add the declared Swift Package Manger depenency to the Pods project 
2.) Add the CocoaLumberjack dependency to the pod target

## Notes:

- Stale SPM dependencies can be handled by removing all non required SPM packages from the Pods project
- Multiple pod might depend on the same SPM package, in such case we'd need to merge requirements and handle potential conflicts






