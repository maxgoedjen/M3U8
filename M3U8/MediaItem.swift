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
    public let language: String
    public let associatedLanguage: String
    public let autoSelect: Bool
    public let isDefault: Bool
    public let uri: String
    public let forced: Bool
    
}

extension MediaItem {
    
    public var description: String {
        return ""
    }
    
}