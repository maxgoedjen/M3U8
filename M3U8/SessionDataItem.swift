//
//  SessionDataItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct SessionDataItem: Item {
    
    public let dataID: String
    public let value: String?
    public let uri: String?
    public let language: String?
    
    public init(dataID: String, value: String? = nil, uri: String? = nil, language: String? = nil) {
        self.dataID = dataID
        self.value = value
        self.uri = uri
        self.language = language
    }
    
    public init?(string: String) {
        let attributes = string.m3u8Attributes
        guard let dataID = attributes["DATA-ID"] else {
            return nil
        }
        self.dataID = dataID
        self.value = attributes["VALUE"]
        self.uri = attributes["URI"]
        self.language = attributes["LANGUAGE"]
    }
    
}

extension SessionDataItem {
    
    public var description: String {
        var components = ["#EXT-X-SESSION-DATA:DATA-ID=\"\(dataID)\""]
        if let value = value {
            components.append("VALUE=\"\(value)\"")
        }
        if let uri = uri {
            components.append("URI=\"\(uri)\"")
        }
        if let language = language {
            components.append("LANGUAGE=\"\(language)\"")
        }
        return ",".join(components)
    }
    
}