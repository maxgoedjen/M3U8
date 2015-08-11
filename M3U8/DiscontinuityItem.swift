//
//  DiscontinuityItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct DiscontinuityItem: Item {
    
    public let description = "#EXT-X-DISCONTINUITY\n"
    
    public init() {
    }
    
}