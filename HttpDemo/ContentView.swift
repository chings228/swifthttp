//
//  ContentView.swift
//  HttpDemo
//
//  Created by man ching chan on 9/8/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    
    var body: some View {
        VStack {
            
            if let complexDataList = vm.complexDataList {
            List{
                
                
                    
                    ForEach(complexDataList.objs){obj in
                        
                        Text("\(obj.id)")
                        Text(obj.val)
                        
                    }
                }
                
                
                
                Text(complexDataList.error.description ?? "no description")
            }
            
            
            
            
            
            Text(vm.postTestData?.aaa ?? "no value")
            Text(vm.postTestData?.bbb ?? "no value")
            
            
            
            Text(vm.githubUser?.avatar_url ?? "no value")
            Text(vm.githubUser?.node_id ?? "no value")
            
            
            List{
                
                ForEach(vm.commentlist){ comment in
                    
                    Text(comment.body)
                    
                }
                
            }

            List{
                
                ForEach(vm.todolist){ todo in
                    
                    Text(todo.title)
                    
                }
                
            }
        }
        .padding()
        .onAppear{
            vm.getCommentData()
            vm.getToDoData()
            vm.getGitHubUser()
            vm.getPostTest()
            vm.getComplexData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
