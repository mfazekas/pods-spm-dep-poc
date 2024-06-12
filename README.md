This is a POC for Cocoapods spm_dependency.

### Usage:

```sh
cd ObjCUIApp
pod install


cd SwiftUIApp
pod installl
```


### What is it?

It's a proof of concept implementation of allowing a library to declare a dependency on a SwiftPackageManger package. Examples:

https://github.com/mfazekas/pods-spm-dep-poc/blob/16d83c15e88770612dc5bc01453ecbee37d08117/ObjCLib/ObjCLib.podspec#L44-L48

https://github.com/mfazekas/pods-spm-dep-poc/blob/16d83c15e88770612dc5bc01453ecbee37d08117/SwiftLib/SwiftLib.podspec#L43-L52

### How it works

See [spm_dependencies_pod.rb](https://github.com/mfazekas/pods-spm-dep-poc/blob/main/spm_dependencies_poc.rb) for implementation.
It does 3 things:

1. Adds the `Package Dependency` to the `Pods` project:
      ![image](https://github.com/mfazekas/pods-spm-dep-poc/assets/52435/8cac68e5-3d2d-4add-a391-195a7768d350)
2. Adds the `targets` dependencies to `Frameworks and Libraries` of the pod (SwiftLib in this case):
      ![image](https://github.com/mfazekas/pods-spm-dep-poc/assets/52435/22ce481a-4e7b-4094-a959-186ec98ac765)
3. Adds to Swift Import Paths: <a id='swift-import-paths'></a>
      ![image](https://github.com/mfazekas/pods-spm-dep-poc/assets/52435/34f61d2e-6aae-4718-ae50-82cad9b83785).
      
      *Note*: this is only needed to work around for a bug in XCode project. If you add a swift package to the non main project, without modifying the `Swift Import Path` you'll get a `no such module "Atomics"` error. It was working fine for ObjC, but not for swift.
 

See https://github.com/CocoaPods/CocoaPods/issues/11942




