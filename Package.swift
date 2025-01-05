// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "MessageInputBar",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "MessageInputBar",
            targets: ["Core", "AttachmentManager", "AutocompleteManager"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            path: "Sources"
        ),
        .target(
            name: "AttachmentManager",
            dependencies: ["Core"],
            path: "Plugins/AttachmentManager"
        ),
        .target(
            name: "AutocompleteManager",
            dependencies: ["Core"],
            path: "Plugins/AutocompleteManager"
        ),
        .testTarget(
            name: "MessageInputBarTests",
            dependencies: ["Core", "AttachmentManager", "AutocompleteManager"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v4_2]
)
