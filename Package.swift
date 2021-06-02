// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DomainSnapshotTestingNimble",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SnapshotTestingNimble",
            targets: ["SnapshotTesting-Nimble"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble", .exact("8.1.2")),
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", .exact("1.8.2")),
        .package(url: "https://github.com/Quick/Quick", .exact("2.1.0")),
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