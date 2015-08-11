//
//  KeyItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct KeyItem {
    
    public let method: String
    public let uri: String
    public let iv: String
    public let keyFormat: String
    public let keyFormatVersions: [String]
    
}

extension KeyItem {
    
    public var description: String {
        return ""
    }
    
}