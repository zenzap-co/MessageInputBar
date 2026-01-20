// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MessageInputBar",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Core MessageInputBar library - explicit dynamic to allow sharing when multiple targets depend on it
        .library(
            name: "MessageInputBar",
            type: .dynamic,
            targets: ["MessageInputBar"]),
        // AttachmentManager plugin
        .library(
            name: "MessageInputBarAttachmentManager",
            targets: ["MessageInputBarAttachmentManager"]),
        // AutocompleteManager plugin
        .library(
            name: "MessageInputBarAutocompleteManager",
            targets: ["MessageInputBarAutocompleteManager"]),
    ],
    dependencies: [
        // No external dependencies
    ],
    targets: [
        // Core target
        .target(
            name: "MessageInputBar",
            dependencies: [],
            path: "Sources",
            exclude: ["Info.plist"],
            publicHeadersPath: "include"
        ),
        // AttachmentManager plugin target
        .target(
            name: "MessageInputBarAttachmentManager",
            dependencies: ["MessageInputBar"],
            path: "Plugins/AttachmentManager"),
        // AutocompleteManager plugin target
        .target(
            name: "MessageInputBarAutocompleteManager",
            dependencies: ["MessageInputBar"],
            path: "Plugins/AutocompleteManager"),
        // Tests
        .testTarget(
            name: "MessageInputBarTests",
            dependencies: ["MessageInputBar"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
