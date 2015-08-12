//
//  Playlist.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct Playlist {
    
    public var items: [Item] = []
    public let version: Int
    public let cache: Bool
    public let target: Int
    public let sequence: Int
    public let type: String
    public let iframesOnly: Bool
    
    public init(version: Int = 3, cache: Bool = true, target: Int = 10, sequence: Int = 0, type: String, iframesOnly: Bool = false) {
        self.version = version
        self.cache = cache
        self.target = target
        self.sequence = sequence
        self.type = type
        self.iframesOnly = iframesOnly
    }
    
    public init?(string: String) {
        return nil
    }
    
    public var playlistSize: Int {
        return 0
//        return items.filter({ $0 is PlaylistItem }).count
    }
    
    public var segmentSize: Int {
        return 0
//        return items.filter({ $0 is SegmentItem }).count
    }
    
    public var valid: Bool {
        return true
    }
    
    public var duration: Double {
        return 0.0
    }
}

extension Playlist: CustomStringConvertible {
    
    public var description: String {
        return ""
    }
    
}