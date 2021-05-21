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

struct ItemModel {
    var id:Int
    var name:String
    var status:Status
    
}
