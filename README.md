# SwiftJson

a json framework of swift. (for study)

learn from 

1. [JSONNeverDie](https://github.com/johnlui/JSONNeverDie)
2. [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
3. [Aldwych_JSON_Swift](https://github.com/sketchytech/Aldwych_JSON_Swift)

![build status](https://travis-ci.org/aotian16/SwiftJson.png)

# Demo

``` swift
    func parseInt() {
        print("------\(__FUNCTION__)------")
        let str = "111"
        let json = JsonParser.p(str)
        print(json)
        print(json.int)
        print(json.intValue)
    }
    
    func parseFloat() {
        print("------\(__FUNCTION__)------")
        let str = "111.234"
        let json = JsonParser.p(str)
        print(json)
        print(json.float)
        print(json.floatValue)
    }
    
    func parseDouble() {
        print("------\(__FUNCTION__)------")
        let str = "111.234"
        let json = JsonParser.p(str)
        print(json)
        print(json.double)
        print(json.doubleValue)
    }
    
    func parseString() {
        print("------\(__FUNCTION__)------")
        let str = "\"abc\""
        let json = JsonParser.p(str)
        print(json)
        print(json.string)
        print(json.stringValue)
    }
    
    func parseBool() {
        print("------\(__FUNCTION__)------")
        let str = "true"
        let json = JsonParser.p(str)
        print(json)
        print(json.bool)
        print(json.boolValue)
    }
    
    func parseArray() {
        print("------\(__FUNCTION__)------")
        let str = "[1,\"hello\",{\"this is a key\":\"this is a value\"}]"
        let json = JsonParser.p(str)
        print(json)
        print(json.array)
        print(json.arrayValue)
        print(json[0].int)
        print(json[0].intValue)
        print(json[1].string)
        print(json[1].stringValue)
        print(json[2].dictionary)
        print(json[2].dictionaryValue)
        print(json[2]["this is a key"].string)
        print(json[2]["this is a key"].stringValue)
    }
    
    func parseDictionary() {
        print("------\(__FUNCTION__)------")
        let str = "{\"key\": [1,\"hello\",{\"this is a key\":\"this is a value\"}]}"
        let json = JsonParser.p(str)
        print(json)
        print(json.dictionary)
        print(json.dictionaryValue)
        print(json["key"])
        print(json["key"][0].int)
        print(json["key"][0].intValue)
        print(json["key"][1].string)
        print(json["key"][1].stringValue)
        print(json["key"][2].dictionary)
        print(json["key"][2].dictionaryValue)
        print(json["key"][2]["this is a key"].string)
        print(json["key"][2]["this is a key"].stringValue)
    }
```

# install

| No.  | type     | detail                             |
| ---- | -------- | ---------------------------------- |
| 1    | carthage | `github "aotian16/SwiftJson"`      |
| 2    | manual   | just copy *.swift to your project. |

# [](https://github.com/aotian16/SwiftColor#requirements)requirements

swift2.0, ios8.0

# [](https://github.com/aotian16/SwiftColor#license)license

MIT

