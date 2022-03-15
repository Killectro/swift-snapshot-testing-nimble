// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DomainSnapshotTestingNimble",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "SnapshotTestingNimble", targets: ["SnapshotTesting-Nimble"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "9.2.0")),
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", .upToNextMajor(from: "1.9.0")),
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "SnapshotTesting-Nimble",
            dependencies: [
                "Nimble",
                "SnapshotTesting",
                "Quick"
            ],
            path: "Sources",
            exclude: ["Info.plist"]
         ),
        .testTarget(
            name: "SnapshotTesting-NimbleTests",
            dependencies: ["SnapshotTesting-Nimble"],
            path: "Tests",
            exclude: ["Info.plist", "__Snapshots__/"]
         )
    ],
    swiftLanguageVersions: [.v5]
)
