//
//  ByteRangeSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class ByteRangeSpec: QuickSpec {
    
    override func spec() {
        
        describe("ByteRange") {
            
            it("should initialize from range") {
                let item = ByteRange(range: 600..<5100)
                expect(item.description) == "4500@600"
            }
            
            it("should initialize from length and start") {
                let item = ByteRange(start: 600, length: 4500)
                expect(item.description) == "4500@600"
            }
            
            it("should initialize from length only") {
                let item = ByteRange(length: 3300)
                expect(item.description) == "3300"
            }
            
            it("should initialize from range string") {
                let item = ByteRange(string: "3500@300")
                expect(item).toNot(beNil())
                expect(item?.description) == "3500@300"
            }

            it("should initialize from length string") {
                let item = ByteRange(string: "4000")
                expect(item).toNot(beNil())
                expect(item?.description) == "4000"
            }
            
            it("should fail for non-int-based data") {
                let item = ByteRange(string: "asdf")
                expect(item).to(beNil())
            }


        }
        
    }
    
}