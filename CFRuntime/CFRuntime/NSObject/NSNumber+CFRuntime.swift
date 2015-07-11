//
//  NSNumber+CFRuntime.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/11.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation

func toDouble(str: String)-> NSNumber{
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString(str)!
    return NSNumber(double: number.doubleValue)
}

func toFloat(str: String)-> NSNumber{
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString(str)!
    return NSNumber(float: number.floatValue)
}