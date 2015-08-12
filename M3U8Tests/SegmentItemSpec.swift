//
//  SegmentItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class SegmentItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("Segment Item") {
            
            it("should initialize with partial parameters") {
                let item = SegmentItem(duration: 10.991, segment: "test.ts")
                expect(item.duration) == 10.991
                expect(item.segment) == "test.ts"
                expect(item.comment).to(beNil())
                expect(item.byteRange).to(beNil())
                expect(item.description) == "#EXTINF:10.991,\ntest.ts"
            }
            
            it("should initialize with full parameters (full range)") {
                let item = SegmentItem(duration: 10.991, segment: "test.ts", comment: "anything", byteRange: ByteRange(range: 600..<5100))
                expect(item.duration) == 10.991
                expect(item.byteRange) == ByteRange(range: 600..<5100)
                expect(item.segment) == "test.ts"
                expect(item.comment) == "anything"
                expect(item.description) == "#EXTINF:10.991,anything\n#EXT-X-BYTERANGE:4500@600\ntest.ts"
            }
            
            it("should initialize with full parameters (length only range)") {
                let item = SegmentItem(duration: 10.991, segment: "test.ts", comment: "anything", byteRange: ByteRange(length: 4500))
                expect(item.duration) == 10.991
                expect(item.byteRange) == ByteRange(length: 4500)
                expect(item.segment) == "test.ts"
                expect(item.comment) == "anything"
                expect(item.description) == "#EXTINF:10.991,anything\n#EXT-X-BYTERANGE:4500\ntest.ts"
            }
            
        }
        
    }
    
}