//
//  NSObject+KeyValues.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation




extension NSObject {
    

    /**  一键字典转模型  */
    class func objectWithKeyValues(dict: NSDictionary) -> Self{
        
        var obj = self.alloc()
        
        self.enumerateProperties{(index: Int, property: CFProperty) -> Void in
            
            var key = property.propertyName
            
            if let val: AnyObject = dict[key] {
            
                /**  数值转NSValue  */
                var typeEnum = property.propertyType.typeEnum
                
                var valueObj = String(format: "\(val)")

                if( CFPropertyTypeEnum.isNumberType(typeEnum)){//Number
                    
                    var num = (valueObj as NSString).doubleValue
                    
//                    
//                    if typeEnum == CFPropertyTypeEnum.NSIntegerType {valueObj =  toFloat(val)}
//                    if typeEnum == CFPropertyTypeEnum.IntType { valueObj = NSNumber(integer:val.toInt()!) }
//                    
//                    if typeEnum == CFPropertyTypeEnum.NSIntegerType {valueObj =  val.toInt()!}
//                    if typeEnum == CFPropertyTypeEnum.CGFloatType {valueObj =  toFloat(val)}
//                    if typeEnum == CFPropertyTypeEnum.FloatType {valueObj = toFloat(val)}
//                    if typeEnum == CFPropertyTypeEnum.DoubleType {valueObj = toDouble(val)}
//
                    
                    obj.setValue(num, forKeyPath: key)
                    
                }else if(CFPropertyTypeEnum.isStringType(typeEnum)){//String
                    
                    if(property.propertyType.isOptional){

                        obj.setValue(valueObj, forKey: key)
                    }
                    
                }else if(CFPropertyTypeEnum.BoolType == typeEnum){//Bool
                    
                    obj.setValue(valueObj != "0", forKeyPath: key)
                    
                }else if(CFPropertyTypeEnum.CustomClassType == typeEnum){//自定义对象
                    
                    //取出对应的dict
                    var dictSub = (dict[key]! as AnyObject) as! NSDictionary
                
                    
                    //实例化对象
                    var objType = property.propertyValue
                    
                    
                    var Cls: NSObject.Type = property.propertyType.type as! NSObject.Type
                    var subObj = Cls.objectWithKeyValues(dictSub)

                    //设置值
                     obj.setValue(subObj, forKeyPath: key)
 
                }
            }
        }

        return obj
    }
    
    
    
    
    /**  一键模型转字典  */
    func keyValues() -> [String: Any]{
        
        var dict = [String: Any]()

        //循环遍历
        for (index,property) in enumerate(self.properties!) {

            var key = property.propertyName
            var value = property.propertyValue
            
            if property.propertyType.isOptional {//属性可选
                
                var valueOptional = value as Any?
                
                if(valueOptional == nil){continue}
            }
            
            
            if(value is Bool){//Bool处理
                
                let boolValue = value as! Bool
                
                value = boolValue ? 1 : 0
                
            }
            
            if(property.propertyType.typeEnum == CFPropertyTypeEnum.CustomClassType){//自定义对象
                
                dict[key] = (property.propertyValue as! NSObject).keyValues()
                
            }else{//普通属性

                dict[key] = value
            }
            
        }
        
        return dict
    }
    
}




