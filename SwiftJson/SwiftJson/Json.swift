//
//  Json.swift
//  SwiftJsonDemo
//
//  Created by 童进 on 15/11/4.
//  Copyright © 2015年 qefee. All rights reserved.
//

import Foundation

/// Json class
public class Json {
    /// NullElement
    public static var NullElement: Json = Json(value: nil)
    /// value of Json
    private var value: JsonValue
    /// cache of dictionary
    private var dictionaryCache: Dictionary<String,Json>?
    /// cache of array
    private var arrayCache: Array<Json>?
    
    /**
     init
     
     - parameter value: AnyObject?
     
     - returns: NullElement
     */
    public init(value: AnyObject?) {
        if value is NSNumber {
            let v = value as! NSNumber
            self.value = .NSNumberType(v)
        } else if value is String {
            let v = value as! String
            self.value = .StringType(v)
        } else if value is Bool {
            let v = value as! Bool
            self.value = .BoolType(v)
        } else if value is Dictionary<String,AnyObject> {
            let v = value as! Dictionary<String,AnyObject>
            self.value = .DictionaryType(v)
        } else if value is Array<AnyObject> {
            let v = value as! Array<AnyObject>
            self.value = .ArrayType(v)
        } else {
            self.value = .NullType
        }
    }
}

// value of Json
extension Json {
    /// string? value
    public var string: String? {
        switch self.value {
        case .StringType(let v):
            return v
        default:
            return nil
        }
    }
    /// string value(default = "")
    public var stringValue: String {
        if let s = string {
            return s
        }
        return ""
    }
    /// int? value
    public var int: Int? {
        switch self.value {
        case .NSNumberType(let v):
            return v.integerValue
        default:
            return nil
        }
    }
    /// int value(default = -1)
    public var intValue: Int {
        if let i = int {
            return i
        }
        return -1
    }
    /// float? value
    public var float: Float? {
        switch self.value {
        case .NSNumberType(let v):
            return v.floatValue
        default:
            return nil
        }
    }
    /// float value(default = -1)
    public var floatValue: Float {
        if let f = float {
            return f
        }
        return -1
    }
    /// double value
    public var double: Double? {
        switch self.value {
        case .NSNumberType(let v):
            return v.doubleValue
        default:
            return nil
        }
    }
    /// double value(default = -1)
    public var doubleValue: Double {
        if let d = double {
            return d
        }
        return -1
    }
    /**
    bool? value

     1. if BoolType     return bool
     2. if NSNumberType return true when value != 0
     3. if StringType   return true when value != ""
    */
    public var bool: Bool? {
        switch self.value {
        case .BoolType(let v):
            return v
        case .NSNumberType(let v):
            if v == 0 {
                return false
            } else {
                return true
            }
        case .StringType(let v):
            if v == "" {
                return false
            } else {
                return true
            }
        default:
            return nil
        }
    }
    /**
    bool value(default = false)
    
    1. if BoolType     return bool
    2. if NSNumberType return true when value != 0
    3. if StringType   return true when value != ""
    */
    public var boolValue: Bool {
        if let b = bool {
            return b
        }
        return false
    }
    /// dictionary? value
    public var dictionary: Dictionary<String,Json>? {
        switch self.value {
        case .DictionaryType(let value):
            if let dic = dictionaryCache {
                return dic
            } else {
                var dic = Dictionary<String,Json>()
                
                for (k,v) in value {
                    dic[k] = Json(value: v)
                }
                dictionaryCache = dic
                return dic
            }
            
        default:
            return nil
        }
    }
    /// dictionary value(default = empty dictionary)
    public var dictionaryValue: Dictionary<String,Json> {
        if let dic = dictionary {
            return dic
        }
        return Dictionary<String,Json>()
    }
    /// array value
    public var array: Array<Json>? {
        switch self.value {
        case .ArrayType(let value):
            if let arr = arrayCache {
                return arr
            } else {
                var arr = Array<Json>()
                
                for v in value {
                    arr.append(Json(value: v))
                }
                arrayCache = arr
                return arr
            }
        default:
            return nil
        }
    }
    /// array value(default = empty array)
    public var arrayValue: Array<Json> {
        if let arr = array {
            return arr
        }
        return Array<Json>()
    }
}

extension Json {
    /**
     sub element of Json(DictionaryType)
     
     - parameter key: key
     
     - returns: Json. NullElement if not found
     */
    public subscript(key: String) -> Json {
        if let dic = dictionary {
            if let v = dic[key] {
                return v
            }
        }
        return Json.NullElement
    }
    /**
     sub element of Json(ArrayType)
     
     - parameter index: index
     
     - returns: Json. NullElement if not found
     */
    public subscript(index: Int) -> Json {
        if let arr = array {
            if index < arr.count && index >= 0 {
                return arr[index]
            }
        }
        return Json.NullElement
    }
}