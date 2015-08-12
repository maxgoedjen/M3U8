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
        return nil
    }
    
}

extension SessionDataItem {
    
    public var description: String {
        return ""
    }
    
}