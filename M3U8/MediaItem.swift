//
//  MediaItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/11/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct MediaItem: Item {

    public let type: String
    public let groupID: String
    public let name: String
    public let language: String?
    public let associatedLanguage: String?
    public let autoSelect: Bool?
    public let isDefault: Bool?
    public let forced: Bool?
    public let uri: String?
    
    public init(type: String, groupID: String, name: String, language: String? = nil, associatedLanguage: String? = nil, autoSelect: Bool? = nil, isDefault:Bool? = nil, forced: Bool? = nil, uri: String? = nil) {
        self.type = type
        self.groupID = groupID
        self.name = name
        self.language = language
        self.associatedLanguage = associatedLanguage
        self.autoSelect = autoSelect
        self.isDefault = isDefault
        self.forced = forced
        self.uri = uri
    }
    
    public init?(string: String) {
        let attributes = string.m3u8Attributes
        guard let type = attributes["TYPE"],
        let groupID = attributes["GROUP-ID"],
            let name = attributes["NAME"]
        else {
            return nil
        }
        self.type = type
        self.groupID = groupID
        self.name = name
        language = attributes["LANGUAGE"]
        associatedLanguage = attributes["ASSOC-LANGUAGE"]
        autoSelect = Bool(string: attributes["AUTOSELECT"])
        isDefault = Bool(string: attributes["DEFAULT"])
        forced = Bool(string: attributes["FORCED"])
        uri = attributes["URI"]
    }
}

extension MediaItem {
    
    public var description: String {
        return ""
    }
    
}