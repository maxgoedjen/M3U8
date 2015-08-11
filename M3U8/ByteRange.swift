//
//  ByteRange.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public struct ByteRange {

    private enum Mode {
        case FullRange(Range<Int>)
        case LengthOnly(Int)
    }
    
    private let value: Mode

    public init(range: Range<Int>) {
        value = .FullRange(range)
    }
    
    public init(start: Int, length: Int) {
        value = .FullRange(start..<(start+length))
    }
    
    public init(length: Int) {
        value = .LengthOnly(length)
    }
    
    public init?(string: String) {
        let values = string.componentsSeparatedByString("@")
        guard let lengthString = values.first, let length = Int(lengthString) else { return nil }
        if values.count == 2,  let start = Int(values[1]) {
            value = .FullRange(start..<(start+length))
        } else {
            value = .LengthOnly(length)
        }
    }
    
}

extension ByteRange: CustomStringConvertible {
    
    public var description: String {
        switch value {
        case .FullRange(let range):
            return "\(range.endIndex-range.startIndex)@\(range.startIndex)"
        case .LengthOnly(let length):
            return "\(length)"
        }
    }
    
}