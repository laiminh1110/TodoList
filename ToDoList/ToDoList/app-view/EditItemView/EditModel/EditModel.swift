//
//  EditModel.swift
//  ToDoList
//
//  Created by VTVH on 6/8/21.
//

import Foundation


struct EditBaseModel:Codable {
    let code:Int
    let data:dataEditBase

}


struct dataEditBase:Codable {
    let message:String
}
