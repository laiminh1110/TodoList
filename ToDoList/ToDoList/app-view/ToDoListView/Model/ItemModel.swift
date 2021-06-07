//
//  ItemModel.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//


import Foundation

enum Status:String {
    case TODO   = "TODO"
    case DOING  = "DOING"
    case DONE   = "DONE"
    
    var result: String {
        return self.rawValue
    }
}

struct RemoveBaseModel:Codable {
    let code:Int
    let data:dataRemoveBase

}

struct dataRemoveBase:Codable {
    let message:String
}

struct BaseModel:Codable {
    let code:Int
    let data:dataBase
    
}

struct dataBase:Codable {
    let total:Int
    let items:[ItemModel]?
}

struct ItemModel:Codable {
    let id:Int
    let name:String
    let status:String
    
}
