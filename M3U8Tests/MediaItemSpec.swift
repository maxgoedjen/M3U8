//
//  MediaItemSpec.swift
//  M3U8
//
//  Created by Max Goedjen on 8/11/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import M3U8
import Nimble
import Quick

class MediaItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("MediaItem") {
            
            it("should initialize from partial parameters") {
                let item = MediaItem(type: "AUDIO", groupID: "audio-lo", name: "Francais", language: "fre", autoSelect: true, isDefault: true, uri: "frelo/prog_index.m3u8")
                expect(item.description) == "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"audio-lo\",LANGUAGE=\"fre\",NAME=\"Francais\",AUTOSELECT=YES,DEFAULT=NO,URI=\"frelo/prog_index.m3u8\""
            }

            it("should initialize from full parameters") {
                let item = MediaItem(type: "AUDIO", groupID: "audio-lo", name: "Francais", language: "fre", associatedLanguage: "spoken", autoSelect: true, isDefault: false, forced: true, uri: "frelo/prog_index.m3u8")
                expect(item.description) == "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"audio-lo\",LANGUAGE=\"fre\",ASSOC-LANGUAGE=\"spoken\",NAME=\"Francais\",AUTOSELECT=YES,DEFAULT=NO,URI=\"frelo/prog_index.m3u8\",FORCED=YES"
            }
            
            it("should initialize from string") {
                let item = MediaItem(string: "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"audio-lo\",LANGUAGE=\"fre\",ASSOC-LANGUAGE=\"spoken\",NAME=\"Francais\",AUTOSELECT=YES,DEFAULT=NO,URI=\"frelo/prog_index.m3u8\",FORCED=YES\n")
                expect(item).toNot(beNil())
                expect(item?.type) == "AUDIO"
                expect(item?.groupID) == "audio-lo"
                expect(item?.language) == "fre"
                expect(item?.associatedLanguage) == "spoken"
                expect(item?.name) == "French"
                expect(item?.autoSelect) == true
                expect(item?.isDefault) == true
                expect(item?.forced) == true
                expect(item?.uri) == "frelo/prog_index.m3u8"
            }

            it("should fail to initialize from string without type/groupid/name") {
                let item = MediaItem(string: "#EXT-X-MEDIA:LANGUAGE=\"fre\",ASSOC-LANGUAGE=\"spoken\",AUTOSELECT=YES,DEFAULT=NO,URI=\"frelo/prog_index.m3u8\",FORCED=YES\n")
                expect(item).to(beNil())
            }

        }
        
    }
    
}