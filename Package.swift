// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LHxHub",
    products: [
        .library(
            name: "LHxHub",
            targets: ["LHxHub"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LHxHub",
            dependencies: []),
        .testTarget(
            name: "LHxHubTests",
            dependencies: ["LHxHub"]),
    ],
    swiftLanguageVersions: [.v5]
)
