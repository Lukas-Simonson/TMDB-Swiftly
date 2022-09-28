// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDB-Swiftly",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
//    platforms: [
//
//    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TMDB-Swiftly",
            targets: ["TMDB-Swiftly"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Hydra-Design/HydraSwiftExtensions", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TMDB-Swiftly",
            dependencies: ["HydraSwiftExtensions"]),
        .testTarget(
            name: "TMDB-SwiftlyTests",
            dependencies: ["TMDB-Swiftly"]),
    ]
)
