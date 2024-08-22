// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PriviumSDK",
    platforms: [
        .iOS(.v13)  // Specify the minimum supported iOS version
    ],
    products: [
        .library(
            name: "PriviumSDK",
            targets: ["PriviumSDK"]),
    ],
    dependencies: [
        // No third-party dependencies are needed since you're using only Apple frameworks
    ],
    targets: [
        .target(
            name: "PriviumSDK",
            dependencies: [],  // No dependencies here either
            path: "Sources"),
        .testTarget(
            name: "PriviumSDKTests",
            dependencies: ["PriviumSDK"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
