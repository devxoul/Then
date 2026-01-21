import ProjectDescription

// MARK: - Project

let project = Project(
  name: "Then",
  options: .options(
    automaticSchemesOptions: .disabled,
    textSettings: .textSettings(
      indentWidth: 2,
      tabWidth: 2,
      wrapsLines: true,
    ),
  ),
  targets: [
    // iOS Framework
    .target(
      name: "Then-iOS",
      destinations: .iOS,
      product: .framework,
      bundleId: "kr.xoul.Then",
      deploymentTargets: .iOS("12.0"),
      sources: ["Sources/Then/**"],
      headers: .headers(public: "Sources/Then/**/*.h"),
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
          "PRODUCT_NAME": "Then",
          "PRODUCT_MODULE_NAME": "Then",
        ],
      ),
    ),
    // iOS Tests
    .target(
      name: "ThenTests-iOS",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "kr.xoul.ThenTests",
      deploymentTargets: .iOS("12.0"),
      sources: ["Tests/ThenTests/**"],
      dependencies: [
        .target(name: "Then-iOS"),
      ],
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
        ],
      ),
    ),
    // macOS Framework
    .target(
      name: "Then-macOS",
      destinations: .macOS,
      product: .framework,
      bundleId: "kr.xoul.Then",
      deploymentTargets: .macOS("10.13"),
      sources: ["Sources/Then/**"],
      headers: .headers(public: "Sources/Then/**/*.h"),
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
          "PRODUCT_NAME": "Then",
          "PRODUCT_MODULE_NAME": "Then",
        ],
      ),
    ),
    // macOS Tests
    .target(
      name: "ThenTests-macOS",
      destinations: .macOS,
      product: .unitTests,
      bundleId: "kr.xoul.ThenTests",
      deploymentTargets: .macOS("10.13"),
      sources: ["Tests/ThenTests/**"],
      dependencies: [
        .target(name: "Then-macOS"),
      ],
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
        ],
      ),
    ),
    // tvOS Framework
    .target(
      name: "Then-tvOS",
      destinations: .tvOS,
      product: .framework,
      bundleId: "kr.xoul.Then",
      deploymentTargets: .tvOS("12.0"),
      sources: ["Sources/Then/**"],
      headers: .headers(public: "Sources/Then/**/*.h"),
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
          "PRODUCT_NAME": "Then",
          "PRODUCT_MODULE_NAME": "Then",
        ],
      ),
    ),
    // tvOS Tests
    .target(
      name: "ThenTests-tvOS",
      destinations: .tvOS,
      product: .unitTests,
      bundleId: "kr.xoul.ThenTests",
      deploymentTargets: .tvOS("12.0"),
      sources: ["Tests/ThenTests/**"],
      dependencies: [
        .target(name: "Then-tvOS"),
      ],
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
        ],
      ),
    ),
    // watchOS Framework
    .target(
      name: "Then-watchOS",
      destinations: .watchOS,
      product: .framework,
      bundleId: "kr.xoul.Then",
      deploymentTargets: .watchOS("4.0"),
      sources: ["Sources/Then/**"],
      headers: .headers(public: "Sources/Then/**/*.h"),
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
          "PRODUCT_NAME": "Then",
          "PRODUCT_MODULE_NAME": "Then",
        ],
      ),
    ),
    // watchOS Tests (note: watchOS test targets need watchOS app host or XCTest on watchOS 7+)
    .target(
      name: "ThenTests-watchOS",
      destinations: .watchOS,
      product: .unitTests,
      bundleId: "kr.xoul.ThenTests",
      deploymentTargets: .watchOS("7.0"),
      sources: ["Tests/ThenTests/**"],
      dependencies: [
        .target(name: "Then-watchOS"),
      ],
      settings: .settings(
        base: [
          "SWIFT_VERSION": "5.0",
        ],
      ),
    ),
  ],
  schemes: [
    .scheme(
      name: "Then-iOS",
      buildAction: .buildAction(targets: ["Then-iOS"]),
      testAction: .targets(["ThenTests-iOS"]),
      runAction: .runAction(configuration: .debug),
    ),
    .scheme(
      name: "Then-macOS",
      buildAction: .buildAction(targets: ["Then-macOS"]),
      testAction: .targets(["ThenTests-macOS"]),
      runAction: .runAction(configuration: .debug),
    ),
    .scheme(
      name: "Then-tvOS",
      buildAction: .buildAction(targets: ["Then-tvOS"]),
      testAction: .targets(["ThenTests-tvOS"]),
      runAction: .runAction(configuration: .debug),
    ),
    .scheme(
      name: "Then-watchOS",
      buildAction: .buildAction(targets: ["Then-watchOS"]),
      testAction: .targets(["ThenTests-watchOS"]),
      runAction: .runAction(configuration: .debug),
    ),
  ],
)
