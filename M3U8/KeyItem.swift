//
//  KeyItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct KeyItem {
    
    public let method: String?
    public let uri: String?
    public let iv: String?
    public let keyFormat: String?
    public let keyFormatVersions: String?
    
    public init(method: String? = nil, uri: String? = nil, iv: String? = nil, keyFormat: String? = nil, keyFormatVersions: String? = nil) {
        self.method = method
        self.uri = uri
        self.iv = iv
        self.keyFormat = keyFormat
        self.keyFormatVersions = keyFormatVersions
    }
    
    public init(string: String) {
        let attributes = string.attributes
        method = attributes["METHOD"]
        uri = attributes["URI"]
        iv = attributes["IV"]
        keyFormat = attributes["KEYFORMAT"]
        keyFormatVersions = attributes["KEYFORMATVERSIONS"]
    }
    
}

extension KeyItem {
    
    public var description: String {
        return ""
    }
    
}