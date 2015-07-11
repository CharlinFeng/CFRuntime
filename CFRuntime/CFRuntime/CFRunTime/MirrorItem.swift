//
//  MirrorItem.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/11.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

public struct MirrorItem {
    
    public let name: String
    
    public let type: Any.Type
    
    public let value: Any
    
    init(_ tup: (String, MirrorType)) {
        self.name = tup.0
        self.type = tup.1.valueType
        self.value = tup.1.value
    }
}

extension MirrorItem : Printable {
    public var description: String {
        return "\(name): \(type) = \(value)"
    }
}