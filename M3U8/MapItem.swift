//
//  MapItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/11/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct MapItem: Item {
    
    public let uri: String
    public let byteRange: ByteRange?
    
    public init(uri: String, byteRange: ByteRange? = nil) {
        self.uri = uri
        self.byteRange = byteRange
    }
    
    public init?(string: String) {
        let attributes = string.m3u8Attributes
        guard let uri = attributes["URI"] else {
            return nil
        }
        self.uri = uri
        if let byteRangeString = attributes["BYTERANGE"] {
            byteRange = ByteRange(string: byteRangeString)
        } else {
            byteRange = nil
        }
    }
    
}

extension MapItem {
    
    public var description: String {
        var strung = "#EXT-X-MAP:URI=\"\(uri)\""
        if let byteRangeString = byteRange?.description {
            strung += ",BYTERANGE=\"\(byteRangeString)\""
        }
        return strung
    }
    
}