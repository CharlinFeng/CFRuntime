//
//  CFPropertyTypeEnum.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

enum CFPropertyTypeEnum{
    
    case unKnown

    case NSIntegerType
    
    case CGFloatType

    case NSStringType
    
    case StringType
    
    case IntType
    
    case BoolType
    
    case FloatType
    
    case DoubleType

    case CustomClassType
    
    
    static var typeDict: [String: CFPropertyTypeEnum] {
    
        return ["NSInteger":NSIntegerType,
            "CGFloat":CGFloatType,
            "NSString":NSStringType,
            "String": StringType,
            "Int":IntType,
            "Float":FloatType,
            "Double":DoubleType,
            "Bool": BoolType,
        ]
    
    }
    
    
    static func calTypeEnum(typeString: String) -> CFPropertyTypeEnum {

        return typeDict[typeString] ?? CFPropertyTypeEnum.CustomClassType
        
        
    }
    
    /**  是否是数值类型  */
    static func isNumberType(typeEnum: CFPropertyTypeEnum) -> Bool{
        
        return typeEnum == CFPropertyTypeEnum.CGFloatType || typeEnum == CFPropertyTypeEnum.FloatType || typeEnum == CFPropertyTypeEnum.DoubleType || typeEnum == CFPropertyTypeEnum.IntType
    }
    
    /**  是否是字符串类型  */
    static func isStringType(typeEnum: CFPropertyTypeEnum) -> Bool{
        return typeEnum == CFPropertyTypeEnum.NSStringType || typeEnum == CFPropertyTypeEnum.StringType
    }

    
}