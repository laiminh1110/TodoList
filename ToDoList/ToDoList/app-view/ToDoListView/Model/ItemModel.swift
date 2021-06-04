//
//  ItemModel.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//


import Foundation

enum Status {
    case todo
    case doing
    case done
    
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
