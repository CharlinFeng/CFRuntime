//
//  NSObject+CFRuntime.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation



/**  反射  */
extension NSObject {
    
    
    /**  类调用  */

    /**  直接获取所有属性  */
    class var properties: [CFProperty]? {
        
        //获取反射对象
        var mirror = Mirror(self)
        
        return CFProperty.refrlectAction(mirror)
    }
    
    
    
    
    /**  直接遍历所有成员对象  */
    class func enumerateProperties(propertyClosure: (index: Int, property: CFProperty)->Void) -> Void{
        
        self.properties?.enumerateArrayUsingClosure({ (i, value) -> Void in
            propertyClosure(index: i, property: value)
        })

    }


    
    /**  方法调用  */
    
    /**  反射所有成员属性对象  */
    var properties: [CFProperty]?{ return CFProperty.refrlectAction(Mirror(self))}
    
    func enumerateProperties(propertyClosure: (index: Int, property: CFProperty)->Void) -> Void{
        
        self.properties?.enumerateArrayUsingClosure({ (i, value) -> Void in
            propertyClosure(index: i, property: value)
        })
        
    }
    

    
}