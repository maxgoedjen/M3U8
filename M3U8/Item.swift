//
//  Item.swift
//  M3U8
//
//  Created by Max Goedjen on 8/10/15.
//  Copyright © 2015 Max Goedjen. All rights reserved.
//

import Foundation

public protocol Item: CustomStringConvertible {
    init?(string: String)
}