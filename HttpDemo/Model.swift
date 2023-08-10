//
//  Model.swift
//  HttpDemo
//
//  Created by man ching chan on 9/8/2023.
//

import Foundation




struct Comment : Codable,Identifiable{
    
    //https://jsonplaceholder.typicode.com/posts
    
    let id : Int
    let userId : Int
    let title : String
    let body : String
}


struct ToDoList : Codable, Identifiable{
    
    //https://jsonplaceholder.typicode.com/todos
    
    let id : Int
    let userId : Int
    let title : String
    let completed : Bool
    
}

struct GithubUser : Codable{
    
    let avatar_url : String
    let node_id : String
    
}
