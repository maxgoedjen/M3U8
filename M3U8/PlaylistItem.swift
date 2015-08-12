//
//  PlaylistItem.swift
//  M3U8
//
//  Created by Max Goedjen on 8/12/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct PlaylistItem {
    
    public let uri: String
    public let iframe: Bool
    public let bandwidth: Int
    public let programID: String?
    public let width: Int?
    public let height: Int?
    public let codecs: [String]
    public let audioCodec: String?
    public let averageBandwidth: Int?
    public let level: Double?
    public let profile: String?
    public let video: String?
    public let audio: String?
    public let subtitles: String?
    public let closedCaptions: String?
    
    public init(uri: String, iframe: Bool, bandwidth: Int, programID: String? = nil, width: Int? = nil, height: Int? = nil, codecs: [String] = [], audioCodec: String? = nil, averageBandwidth: Int? = nil, level: Double? = nil, profile: String? = nil, video: String? = nil, audio: String? = nil, subtitles: String? = nil, closedCaptions: String? = nil) {
        self.uri = uri
        self.iframe = iframe
        self.bandwidth = bandwidth
        self.programID = programID
        self.width = width
        self.height = height
        self.codecs = codecs
        self.audioCodec = audioCodec
        self.averageBandwidth = averageBandwidth
        self.level = level
        self.profile = profile
        self.video = video
        self.audio = audio
        self.subtitles = subtitles
        self.closedCaptions = closedCaptions
    }
    
}