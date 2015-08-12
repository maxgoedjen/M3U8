//
//  String+M3U8AttributesSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/11/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

import M3U8
import Nimble
import Quick

class String_M3U8AttributesSpec: QuickSpec {
    
    override func spec() {
        
        describe("String+M3U8AttributesSpec") {
            
            it("should parse attributes to dictionary") {
                let string = "TEST-ID=\"Help\",URI=\"http://test\",ID=33\n"
                let parsed = string.m3u8Attributes
                expect(parsed["TEST-ID"]) == "Help"
                expect(parsed["URI"]) == "http://test"
                expect(parsed["ID"]) == "33"
            }
            
            it("should allow boolean initialization with strings") {
                expect(Bool(string: "YES")) == true
                expect(Bool(string: "TRUE")) == true
                expect(Bool(string: "NO")) == false
                expect(Bool(string: "FALSE")) == false
                expect(Bool(string: nil)).to(beNil())
            }
         
            it("should format bool to string correctly") {
                expect(Bool(string: "YES")!.m3u8Description) == "YES"
                expect(Bool(string: "NO")!.m3u8Description) == "NO"
            }
            
        }
        
    }
    
}