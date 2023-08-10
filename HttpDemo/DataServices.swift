//
//  DataServices.swift
//  HttpDemo
//
//  Created by man ching chan on 9/8/2023.
//

import Foundation



class DataServices{
    
    
    
    static func getData(url : String , completionHandler : @escaping (_ data: Data? , _ error:String?)->()){
        
        
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
            
                if let error = error{
                   
                   
                        completionHandler(nil,error.localizedDescription)
                        return
                    
                }
                
                guard let data = data else {return}
                
                print(data)
            
        
                completionHandler(data,nil)
            }
            
            
            
        }
        .resume()
        
        
        
        
        
    }
    
    
    
    
    static func getDataWithType<T:Decodable>(url : String ,classtype : T.Type, completionHandler : @escaping (_ list: Any , _ error:String?)->()){
        
        print("\(classtype)")
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                
                if let error = error{

                        completionHandler("",error.localizedDescription)
                        return

                }
                
                guard let data = data else {return}
                
                print(data)
                
                guard let list = try? JSONDecoder().decode(classtype, from: data) else {
                    
                    return
                    
                }
                
                

              
            
                completionHandler(list,nil)
            }
            
            
            
        }
        .resume()
        
        
        
        
        
    }
 
}
