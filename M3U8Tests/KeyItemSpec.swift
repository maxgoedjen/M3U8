//
//  KeyItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class KeyItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("KeyItem") {
            
            it("should initialize with parameters") {
                let item = KeyItem(method: "AES-128", uri: "http://test.key", iv: "D512BBF", keyFormat: "identity", keyFormatVersions: "1/3")
                expect(item.method) == "AES-128"
                expect(item.uri) == "http://test.key"
                expect(item.iv) == "D512BBF"
                expect(item.keyFormat) == "identity"
                expect(item.keyFormatVersions) == "1/3"
                expect(item.description) == "#EXT-X-KEY:METHOD=AES-128,URI=\"http://test.key\",IV=D512BBF,KEYFORMAT=\"identity\",KEYFORMATVERSIONS=\"1/3\""
            }
            
            it("should initialize with only partial parameters") {
                let item = KeyItem(method: "AES-128", uri: "http://test.key")
                expect(item.description) == "#EXT-X-KEY:METHOD=AES-128,URI=\"http://test.key\""
            }
            
            it("should initialize with only method") {
                let item = KeyItem(method: "NONE")
                expect(item.description) == "#EXT-X-KEY:METHOD=NONE"
            }
            
            it("should initialize with string") {
                let string = "#EXT-X-KEY:METHOD=AES-128,URI=\"http://test.key\",IV=D512BBF,KEYFORMAT=\"identity\",KEYFORMATVERSIONS=\"1/3\""
                let item = KeyItem(string: string)
                expect(item).toNot(beNil())
                expect(item?.method) == "AES-128"
                expect(item?.uri) == "http://test.key"
                expect(item?.iv) == "D512BBF"
                expect(item?.keyFormat) == "identity"
                expect(item?.keyFormatVersions) == "1/3"
            }

            it("shoudl fail to initialize from string without method") {
                let string = "#EXT-X-KEY:URI=\"http://test.key\",IV=D512BBF,KEYFORMAT=\"identity\",KEYFORMATVERSIONS=\"1/3\""
                let item = KeyItem(string: string)
                expect(item).to(beNil())
            }

        }
        
    }
    
}