//
//  CFRuntimeCommon.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation


extension Array{
    
    /** 仿OC遍历 */
    func enumerateArrayUsingClosure(itemClosure: (index: Int , value: T)->Void){
        
        for (var i=0;i<self.count;i++){
            
            itemClosure(index: i, value: self[i])
        }
    }
}

extension String{
    
    /**  字符串替换  */
    func test(){
        
        var special = [""]
        

        
    }
}

func findFirst<S : SequenceType> (s: S, condition: (S.Generator.Element) -> Bool) -> S.Generator.Element? {
    
    for value in s {
        if condition(value) {
            return value
        }
    }
    return nil
}