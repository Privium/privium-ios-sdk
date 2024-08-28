// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PriviumSDK",
    platforms: [
        .iOS(.v13),  // Minimum supported iOS version
        .macOS(.v10_15)  // Minimum supported macOS version for APIs like SymmetricKey and AES
    ],
    products: [
        .library(
            name: "PriviumSDK",
            targets: ["PriviumSDK"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PriviumSDK",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "PriviumSDKTests",
            dependencies: ["PriviumSDK"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
