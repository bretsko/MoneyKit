// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MoneyKit",
    platforms: [
        .macOS(.v10_15), .iOS(.v14)//, .tvOS(.v10), .watchOS(.v4)
    ],
    products: [
        .library(
            name: "MoneyKit",
            targets: ["MoneyKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bretsko/LocalBase", .exact("1.0.0")),
        // .package(url: "../LocalBase", .exact("1.0.0")),
        
        // .package(url: "../Quick/Quick", .exact("1.0.0")),
        // .package(url: "../Quick/Nimble", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Quick", from: "2.2.1"),
        .package(url: "https://github.com/bretsko/Nimble", from: "8.0.5"),
    ],
    targets: [
        .target(
            name: "MoneyKit",
            dependencies: [ "LocalBase"]),
        
        .testTarget(
            name: "MoneyKitTests",
            dependencies: ["MoneyKit", 
                           "Quick", "Nimble"]),
    ]
)


