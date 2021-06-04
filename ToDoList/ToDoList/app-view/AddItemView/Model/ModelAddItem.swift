//
//  ModelAddItem.swift
//  ToDoList
//
//  Created by VTVH on 6/4/21.
//

import Foundation

struct AddModel:Codable {
    let code:Int
    let data:dataItem
    
}

struct dataItem:Codable {
    let message:String
}
