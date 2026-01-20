// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MessageInputBar",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Core MessageInputBar library
        // Note: Target is named differently to avoid SPM static linking conflict
        .library(
            name: "MessageInputBar",
            targets: ["MessageInputBarCore"]),
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
        // Core target - named MessageInputBarCore to avoid SPM conflict with product name
        .target(
            name: "MessageInputBarCore",
            dependencies: [],
            path: "Sources",
            exclude: ["Info.plist"],
            publicHeadersPath: "include"
        ),
        // AttachmentManager plugin target
        .target(
            name: "MessageInputBarAttachmentManager",
            dependencies: ["MessageInputBarCore"],
            path: "Plugins/AttachmentManager"),
        // AutocompleteManager plugin target
        .target(
            name: "MessageInputBarAutocompleteManager",
            dependencies: ["MessageInputBarCore"],
            path: "Plugins/AutocompleteManager"),
        // Tests
        .testTarget(
            name: "MessageInputBarTests",
            dependencies: ["MessageInputBarCore"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
