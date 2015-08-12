//
//  KeyItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct KeyItem: Item {
    
    public let method: String
    public let uri: String?
    public let iv: String?
    public let keyFormat: String?
    public let keyFormatVersions: String?
    
    public init(method: String, uri: String? = nil, iv: String? = nil, keyFormat: String? = nil, keyFormatVersions: String? = nil) {
        self.method = method
        self.uri = uri
        self.iv = iv
        self.keyFormat = keyFormat
        self.keyFormatVersions = keyFormatVersions
    }
    
    public init?(string: String) {
        let attributes = string.m3u8Attributes
        guard let method = attributes["METHOD"] else {
            return nil
        }
        self.method = method
        uri = attributes["URI"]
        iv = attributes["IV"]
        keyFormat = attributes["KEYFORMAT"]
        keyFormatVersions = attributes["KEYFORMATVERSIONS"]
    }
    
}

extension KeyItem {
    
    public var description: String {
        var components = ["#EXT-X-KEY:METHOD=\(method)"]
        if let uri = uri {
            components.append("URI=\"\(uri)\"")
        }
        if let iv = iv {
            components.append("IV=\(iv)")
        }
        if let keyFormat = keyFormat {
            components.append("KEYFORMAT=\"\(keyFormat)\"")
        }
        if let keyFormatVersions = keyFormatVersions {
            components.append("KEYFORMATVERSIONS=\"\(keyFormatVersions)\"")
        }
        return ",".join(components)
    }
    
}