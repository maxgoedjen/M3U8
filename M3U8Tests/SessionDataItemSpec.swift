//
//  SessionDataItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class SessionDataItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("Session Data Item") {
            
            it("should initialize with parameters") {
                let item = SessionDataItem(dataID: "com.test.movie.title", value: "Test", uri: "http://test", language: "en")
                expect(item.dataID) == "com.test.movie.title"
                expect(item.value) == "Test"
                expect(item.uri) == "http://test"
                expect(item.language) == "en"
                expect(item.description) == "#EXT-X-SESSION-DATA:DATA-ID=\"com.test.movie.title\",VALUE=\"Test\",URI=\"http://test\",LANGUAGE=\"en\""
            }

            it("should initialize from parameters without URI") {
                let item = SessionDataItem(dataID: "com.test.movie.title", value: "Test", language: "en")
                expect(item.dataID) == "com.test.movie.title"
                expect(item.value) == "Test"
                expect(item.language) == "en"
                expect(item.description) == "#EXT-X-SESSION-DATA:DATA-ID=\"com.test.movie.title\",VALUE=\"Test\",LANGUAGE=\"en\""
            }
            
            it("should initialize from parameters without value") {
                let item = SessionDataItem(dataID: "com.test.movie.title", uri: "http://test", language: "en")
                expect(item.dataID) == "com.test.movie.title"
                expect(item.uri) == "http://test"
                expect(item.language) == "en"
                expect(item.description) == "#EXT-X-SESSION-DATA:DATA-ID=\"com.test.movie.title\",URI=\"http://test\",LANGUAGE=\"en\""
            }
            
            it("should initialize from string without URI") {
                let item = SessionDataItem(string: "#EXT-X-SESSION-DATA:DATA-ID=\"com.test.movie.title\",VALUE=\"Test\",LANGUAGE=\"en\"")
                expect(item).toNot(beNil())
                expect(item?.dataID) == "com.test.movie.title"
                expect(item?.value) == "Test"
                expect(item?.uri).to(beNil())
                expect(item?.language) == "en"
            }
            
            it("should initialize from string without value") {
                let item = SessionDataItem(string: "#EXT-X-SESSION-DATA:DATA-ID=\"com.test.movie.title\",URI=\"http://test\",LANGUAGE=\"en\"")
                expect(item).toNot(beNil())
                expect(item?.dataID) == "com.test.movie.title"
                expect(item?.value).to(beNil())
                expect(item?.uri) == "http://test"
                expect(item?.language) == "en"
            }

            it("should fail to initialize from string without data id") {
                let item = SessionDataItem(string: "#EXT-X-SESSION-DATA:URI=\"http://test\",LANGUAGE=\"en\"")
                expect(item).to(beNil())
            }

        }
        
    }
    
}