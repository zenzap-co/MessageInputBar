// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MessageInputBar",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "MessageInputBar",
            targets: ["MessageInputBar"]
        ),
        .library(
            name: "AttachmentManager",
            targets: ["AttachmentManager"]
        ),
        .library(
            name: "AutocompleteManager", 
            targets: ["AutocompleteManager"]
        )
    ],
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
            dependencies: ["MessageInputBar"],
            path: "Tests"
        )
    ]
)