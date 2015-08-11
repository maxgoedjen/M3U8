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
            
            it("should initialize from uri and byterange") {
                let item = MapItem(uri: "frelo/prog_index.m3u8", byteRange: ByteRange(range: 600..<5100))
                expect(item.description) == "#EXT-X-MAP:URI=\"frelo/prog_index.m3u8\",BYTERANGE=\"4500@600\""
            }
            
            it("should initialize with uri only") {
                let item = MapItem(uri: "frelo/prog_index.m3u8")
                expect(item.description) == "#EXT-X-MAP:URI=\"frehi/prog_index.m3u8\""
            }
            
            it("should initialize from string") {
                let item = MapItem(string: "#EXT-X-MAP:URI=\"frelo/prog_index.m3u8\",BYTERANGE=\"3500@300\"")
                expect(item).toNot(beNil())
                expect(item?.uri) == "frelo/prog_index.m3u8"
                expect(item?.byteRange) == ByteRange(range: 300..<3800)
            }

            it("should fail to initialize from string without uri") {
                let item = MapItem(string: "#EXT-X-MAP:BYTERANGE=\"3500@300\"")
                expect(item).to(beNil())
            }

        }
        
    }
    
}