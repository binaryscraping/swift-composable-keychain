// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ComposableKeychain",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "ComposableKeychain",
      targets: ["ComposableKeychain"])
  ],
  dependencies: [
    .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.33.0"),
  ],
  targets: [
    .target(
      name: "ComposableKeychain",
      dependencies: [
        "KeychainAccess",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
      ]),
    .testTarget(
      name: "ComposableKeychainTests",
      dependencies: ["ComposableKeychain"]),
  ]
)
