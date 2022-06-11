//
//  Book.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import ObjectMapper

struct BookContainer: Mappable {
    
    var book: [Book]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        book <- map["data"]
    }
}

struct Book: Mappable {
    
    var title = ""
    var author = ""
    var cover = ""
    var file = ""
    var comment = 0
    var like = 0
    var isSelected: Bool = false
    var price = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        author <- map["author"]
        cover <- map["cover"]
        file <- map["file"]
        comment <- map["comment"]
        like <- map["like"]
        price <- map["price"]
    }
}

struct DetailBook: Mappable {
    
    var content = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        content <- map["content"]
    }
}
