// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "Then",
  platforms: [
    .macOS(.v11), .iOS(.v11), .tvOS(.v12), .watchOS(.v2)
  ],
  products: [
    .library(name: "Then", targets: ["Then"]),
  ],
  targets: [
    .target(name: "Then", path: "Sources", resources: [.copy("PrivacyInfo.xcprivacy")]),
    .testTarget(name: "ThenTests", dependencies: ["Then"]),
  ]
)
