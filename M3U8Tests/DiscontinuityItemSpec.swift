//
//  DiscontinuityItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class DiscontinuityItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("DiscontinuityItem") {
            
            it("should provide m3u8 format representation") {
                let item = DiscontinuityItem()
                expect(item.description) == "#EXT-X-DISCONTINUITY\n"
            }
            
        }
        
    }
    
}