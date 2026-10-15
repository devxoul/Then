// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "Then",
  platforms: [
    .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v9)
  ],
  products: [
    .library(name: "Then", targets: ["Then"]),
  ],
  targets: [
    .target(name: "Then", path: "Sources", resources: [.copy("PrivacyInfo.xcprivacy")]),
    .testTarget(name: "ThenTests", dependencies: ["Then"]),
  ],
)
