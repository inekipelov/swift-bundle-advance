// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-bundle-advance",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "BundleAdvance",
            targets: ["BundleAdvance"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/inekipelov/swift-bundle-id.git", from: "0.1.0"),
        .package(url: "https://github.com/inekipelov/swift-info-dictionary-key.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "BundleAdvance",
            dependencies: [
                .product(name: "BundleID", package: "swift-bundle-id"),
                .product(name: "InfoDictionaryKeys", package: "swift-info-dictionary-key")
            ]
        ),
        .testTarget(
            name: "BundleAdvanceTests",
            dependencies: ["BundleAdvance"],
            resources: [
                .copy("Fixtures/BundleAdvanceFixture.bundle"),
                .copy("Fixtures/BundleAdvanceExtensionFixture.appex"),
                .copy("Fixtures/BundleAdvancePathFallbackFixture.appex")
            ]
        )
    ]
)
