//
//  ViewController.swift
//  CFRuntime
//
//  Created by 成林 on 15/7/10.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


enum StudentType: Int{
    
    case Good = 0
    case Normal
    case Bad
}


struct Line {
    var start: Float
    var end: Float
}

class Pet {
    
}



class Person: NSObject {

    var name: NSString?    
    var age: Int = 0
    var age2: NSInteger = 0
    
    var weight: Float = 0
    
    var weight2: CGFloat = 0
    
    var money: Double = 0
    
    var isLikeStudy: Bool = false

    var cat: Cat = Cat()
}


class Cat: NSObject {
    
    var name: String?
    
    var price: Double = 0
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        var dict = [
            
            "name":"张三",
            
            "age": "28",
            
            "age2":"28",
            
            "weight":"120",
            
            "weight2":"120",
            
            "money":"1800000",
            
            "isLikeStudy":"1",
            
            "stuType":"1",
            
            "cat": [
                
                "name": "多多",
                
                "price": "4000"
            
            ]
        ]
        

        //kvc
        var person = Person.objectWithKeyValues(dict)
        
        var dict2 = person.keyValues()
        
        println(dict2)
    }


}

