[RFC] - Swift Package Manager dependency


## Background

Swift Package Manager is becoming the de-facto standard for new libraries, do to it's builtin support in XCode. Cocoapods libraries that want's to consume a SPM package have these choices right now:
- convert their lib to SPM and migrate off CocoaPods
- write a pod spec for the dependency
- ask users to install the SPM manually [?]

## Suggested solution

Introduce SPM dependencies as part of pod spec.

In ruby this could look like:

```ruby
spec.spm_dependency(url: "https://example.com/example-package.git", from: "1.2.3")
```

This would perform the following modifications:
1.) Add the declared SPM pacakge as a dependency to the Pods project 
2.) Add 

## Potential issues:

- Removal of stale SPM dependencies from the project (if pod `A` depends on `SpmA` swift package, when we remove pod `A` from depencies should we remove `SpmA` as well? I assume we could check if anyone still uses `SpmA` and keep it and remove otherwise)
- Conflicting SPM dependenicies



