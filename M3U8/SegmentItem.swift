//
//  SegmentItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct SegmentItem: Item {
    
    public let duration: Double
    public let segment: String
    public let comment: String?
    public let byteRange: ByteRange?
    
    public init(duration: Double, segment: String, comment: String? = nil, byteRange: ByteRange? = nil) {
        self.duration = duration
        self.segment = segment
        self.comment = comment
        self.byteRange = byteRange
    }
    
    public init?(string: String) {
        return nil
    }
    
}

extension SegmentItem {
    
    public var description: String {
        let byteRangeFormat: String
        if let range = byteRange {
            byteRangeFormat = "\n#EXT-X-BYTERANGE:\(range)"
        } else {
            byteRangeFormat = ""
        }
        let commentFormat = comment ?? ""
        return "#EXTINF:\(duration),\(commentFormat)\(byteRangeFormat)\n\(segment)"
    }
    
}