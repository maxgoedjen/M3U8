//
//  MapItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/11/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class MapItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("MapItem") {
            
            it("should provide m3u8 format representation") {
                let item = DiscontinuityItem()
                expect(item.description) == "#EXT-X-DISCONTINUITY\n"
            }
            
        }
        
    }
    
}