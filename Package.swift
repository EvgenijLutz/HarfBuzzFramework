// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HarfBuzzFramework",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "HarfBuzzFramework",
            targets: ["HarfBuzzFramework"]
        ),
        .library(
            name: "HarfBuzzC",
            targets: ["HarfBuzzC"]
        ),
        .library(
            name: "HarfBuzz",
            targets: ["HarfBuzz"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/EvgenijLutz/FreeTypeFramework.git", exact: "2.13.3-alpha4"),
    ],
    targets: [
        .binaryTarget(
            name: "HarfBuzz",
            path: "HarfBuzz.xcframework"
        ),
        .target(
            name: "HarfBuzzC",
            dependencies: [
                .product(name: "FreeTypeC", package: "FreeTypeFramework"),
                .target(name: "HarfBuzz")
            ]
        ),
        .target(
            name: "HarfBuzzFramework",
            dependencies: [
                .product(name: "FreeTypeFramework", package: "FreeTypeFramework"),
                .target(name: "HarfBuzzC")
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]
        ),
    ]
)
