//
//  String+M3U8Attributes.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

extension String {
    
    public var attributes: [String: String] {
        guard let firstLine = componentsSeparatedByString("\n").first else { return [:] }
        // Wooooooo string escapes
        // Reference Ruby-style regex: /([A-z-]+)\s*=\s*("[^"]*"|[^,]*)/
        do {
            let regex = try NSRegularExpression(pattern: "([A-z-]+)\\s*=\\s*(\"[^\"]*\"|[^,]*)", options: [])
            let matches = regex.matchesInString(firstLine, options: [], range: NSMakeRange(0, (firstLine as NSString).length))
            return matches.reduce([:] as [String: String]) { acc, next in
                let nsStrung = firstLine as NSString
                let key = nsStrung.substringWithRange(next.rangeAtIndex(0))
                let value = nsStrung.substringWithRange(next.rangeAtIndex(1))
                var modifiedAccum = acc
                modifiedAccum[key] = value
                return modifiedAccum
            }
        } catch _ {
            return [:]
        }
    }
    
}