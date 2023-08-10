//
//  ViewModel.swift
//  HttpDemo
//
//  Created by man ching chan on 9/8/2023.
//

import Foundation
import UIKit






class ViewModel : ObservableObject{
    
    @Published var commentlist: [Comment]  = []
    
    @Published var todolist: [ToDoList]  = []
    
    @Published var githubUser : GithubUser?
    
    func getCommentData(){
        
        let url = "https://jsonplaceholder.typicode.com/posts"

        
        DataServices.getDataWithType(url: url, classtype: [Comment].self) { data, error in
            
            print("datatype")
            print(data)
            if let error = error{
                
                print(error)
                
                return
            }


            
            self.commentlist = data as! [Comment]

          
        }
    }
    
    
    
    
    func getGitHubUser(){
        
        let url = "https://api.github.com/users/chings228"
        
        
        DataServices.getDataWithType(url: url, classtype: GithubUser.self) { data, error in
            
            print("datatype")
            print(data)
            if let error = error{
                
                print(error)
                
                return
            }


            
            self.githubUser = data as? GithubUser

          
        }
        
        
    }
    
    
    
        
        
        func getToDoData(){
            
            let url = "https://jsonplaceholder.typicode.com/todos"
            
            
            DataServices.getData(url: url) { data, error in
                
                
                guard let data = data else {return}
                
                
                guard let list = try? JSONDecoder().decode([ToDoList].self, from: data) else {return}
                
                
                
                self.todolist = Array(list.prefix(upTo: 2))
                
            }
        }
    
    
    
    
        
    

}
