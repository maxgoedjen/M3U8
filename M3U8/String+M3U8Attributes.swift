//
//  String+M3U8Attributes.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public extension String {
    
    public var m3u8Attributes: [String: String] {
        guard let firstLine = componentsSeparatedByString("\n").first else { return [:] }
        // Wooooooo string escapes
        // Reference Ruby-style regex: /([A-z-]+)\s*=\s*("[^"]*"|[^,]*)/
        do {
            let regex = try NSRegularExpression(pattern: "([A-z-]+)\\s*=\\s*(\"[^\"]*\"|[^,]*)", options: [])
            let matches = regex.matchesInString(firstLine, options: [], range: NSMakeRange(0, (firstLine as NSString).length))
            return matches.reduce([:] as [String: String]) { acc, next in
                let nsStrung = firstLine as NSString
                let key = nsStrung.substringWithRange(next.rangeAtIndex(1))
                let value = nsStrung.substringWithRange(next.rangeAtIndex(2)).stringByReplacingOccurrencesOfString("\"", withString: "")
                var modifiedAccum = acc
                modifiedAccum[key] = value
                return modifiedAccum
            }
        } catch _ {
            return [:]
        }
    }
    
}

public extension Bool {
    
    public init?(string: String?) {
        guard let string = string else { return nil }
        self = (string as NSString).boolValue
    }
    
}