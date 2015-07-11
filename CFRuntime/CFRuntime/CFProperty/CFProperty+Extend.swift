//
//  CFProperty+Extend.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/11.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

extension CFProperty{
    
    class func refrlectAction(mirror: Mirror) -> [CFProperty]?{
    
        //获取所有属性名
        var propertyNames = mirror.names
        
        /**  获取所有的值  */
        var propertyVaues = mirror.values
        
        /**  获取所有的类型  */
        var types = mirror.types
        
        /**  获取所有类型名  */
        var typeNames = mirror.typesShortName
        
        return CFProperty.makeProperties(propertyNames, values: propertyVaues, types:types ,typeNames:typeNames)
    }
        
}