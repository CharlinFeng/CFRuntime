//
//  CFProperty.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation




class CFProperty {
    
    /**  属性名  */
    var propertyName: String
    
    /**  属性值  */
    var propertyValue: Any
    
    /**  属性类型  */
    var propertyType: CFPropertyType
    

    
    /**  直接构造方法  */
    init(propertyName: String,value: Any ,type: Any.Type , typeName: String){
        
        self.propertyName = propertyName
        
        self.propertyValue = value
        
        self.propertyType = CFPropertyType(typeNameOriginal: typeName,type: type, selfType: value.self)
    }
    
    
    
    class func makeProperties (keys: [String],values: [Any], types:[Any.Type], typeNames: [String]) -> [CFProperty]? {
        
        var properties: [CFProperty] = []
        
        for var i=0; i<keys.count; i++ {
            
            let propertyName = keys[i]
            
            if(propertyName == "super") {continue}
            
            let typeName = typeNames[i]
            
            let type = types[i]
            
            var property = CFProperty(propertyName: propertyName,value: values[i],type:type , typeName: typeName)
            
            properties.append(property)
        }
        
        return properties
    }
}





