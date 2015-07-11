//
//  Mirror+Extend.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/11.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

extension Mirror : CollectionType, SequenceType {
    
    init(_ Cls: NSObject.Type){
        
        self.instance = Cls()
        mirror = reflect(instance)
    }
    
    init(_ instance: NSObject){
        
        self.instance = instance
        mirror = reflect(instance)
    }
    
    public var names: [String] {
        return map(self) { $0.name }
    }
    
    
    public var values: [Any] {
        return map(self) { $0.value }
    }
    
    
    public var types: [Any.Type] {
        return map(self) { $0.type }
    }
    
    
    public var typesShortName: [String] {
        return map(self) { "\($0.type)"}
    }
    
    public var children: [MirrorItem] {
        return map(self) { $0 }
    }
    
    public subscript (key: String) -> Any? {
        let res = findFirst(self) { $0.name == key }
        return res.map { $0.value }
    }
    
    
    public func get<U>(key: String) -> U? {
        let res = findFirst(self) { $0.name == key }
        return res.flatMap { $0.value as? U }
    }
    
    public var toDictionary: [String : Any] {
        
        var result: [String : Any] = [ : ]
        for item in self {
            result[item.name] = item.value
        }
        
        return result
    }
    
    public var toNSDictionary: NSDictionary {
        
        var result: [String : AnyObject] = [ : ]
        for item in self {
            result[item.name] = item.value as? AnyObject
        }
        
        return result
    }

    
    public func generate() -> IndexingGenerator<[MirrorItem]> {
        return children.generate()
    }
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return mirror.count
    }
    
    public subscript (i: Int) -> MirrorItem {
        return MirrorItem(mirror[i])
    }
}
