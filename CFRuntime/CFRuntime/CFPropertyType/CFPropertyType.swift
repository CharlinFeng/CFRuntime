//
//  CFPropertyType.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

class CFPropertyType {
    
    /**  类型名  */
    var typeName: String{ didSet{ self.calTypeEnum() } }
    
    var typeEnum: CFPropertyTypeEnum
    
    /**  是否是可选类型  */
    var isOptional: Bool
    
    /**  type  */
    var type: Any.Type
    
    /**  selfType  */
    var selfType: Any
    
    /**  直接构造方法  */
    init(typeNameOriginal: String,type: Any.Type, selfType: Any){
    
        self.isOptional = false
        self.typeName = ""
        self.typeEnum = CFPropertyTypeEnum.unKnown
        self.type = type
        self.selfType = selfType
        self.typeNameOriginal = typeNameOriginal

    }
}

extension CFPropertyType{
    
    
    var optionalString: String {return "Optional"}
    var specialStrings:[String] {return ["Swift","Optional","<",">","\""]}

    private var typeNameOriginal: String{
        
        set{ handleTypeName(newValue)}
        
        get{ return typeName }
        
    }
    

    /**
    处理名字
    
    :param: name 类型名
    : 这个地方异常复杂，后期还需要做以下处理：
    : 1.正则处理swift数组
    : 2.反向引用获取swift数组泛型值类型，获取命名空间层次
    */
    private func handleTypeName(name: String){

        var nameNSStringM = NSMutableString(string: name)
        
        isOptional = nameNSStringM.rangeOfString(optionalString).length > 1
    
        //去除杂质
        specialStrings.enumerateArrayUsingClosure { (index: Int, value: String) -> Void in
            
            nameNSStringM.replaceOccurrencesOfString(value, withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: NSMakeRange(0, nameNSStringM.length))
        }

        //分离命名空间
        typeName = nameNSStringM.componentsSeparatedByString(".").last as! String
    }

    

    /**  计算具体类型  */
    private func calTypeEnum(){
        
        self.typeEnum = CFPropertyTypeEnum.calTypeEnum(self.typeName)
        
    }
    
}