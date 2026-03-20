# BundleAdvance

`BundleAdvance` adds convenience `Bundle` extensions for common app
metadata and app extension detection.

It gives clients a single import for strongly typed bundle identifiers,
Info.plist access, and high-level bundle properties.

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6.0+-F05138?logo=swift&logoColor=white" alt="Swift 6.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/iOS-13.0+-000000?logo=apple" alt="iOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/macOS-10.15+-000000?logo=apple" alt="macOS 10.15+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/tvOS-13.0+-000000?logo=apple" alt="tvOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/watchOS-6.0+-000000?logo=apple" alt="watchOS 6.0+"></a>
  <a href="https://developer.apple.com/visionos/"><img src="https://img.shields.io/badge/visionOS-1.0+-000000?logo=apple" alt="visionOS 1.0+"></a>
</p>

## Installation

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/inekipelov/swift-bundle-advance.git", from: "0.1.0")
```

Then add `BundleAdvance` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        "BundleAdvance"
    ]
)
```

## Usage

```swift
import BundleAdvance

let bundle = Bundle.main

print(bundle.appName)         // MyApp
print(bundle.shortVersion)    // 1.2.3
print(bundle.version)         // 123
print(bundle.identifier)      // com.example.my-app
print(bundle.isAppExtension)  // false
```
