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
            targets: ["MessageInputBar", "AttachmentManager", "AutocompleteManager"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MessageInputBar",
            path: "Sources"
        ),
        .target(
            name: "AttachmentManager",
            dependencies: ["MessageInputBar"],
            path: "Plugins/AttachmentManager"
        ),
        .target(
            name: "AutocompleteManager",
            dependencies: ["MessageInputBar"],
            path: "Plugins/AutocompleteManager"
        ),
        .testTarget(
            name: "MessageInputBarTests",
            dependencies: ["MessageInputBar", "AttachmentManager", "AutocompleteManager"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v4_2]
)
