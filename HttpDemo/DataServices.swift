//
//  DataServices.swift
//  HttpDemo
//
//  Created by man ching chan on 9/8/2023.
//

import Foundation


enum httpType{
    case post
    case get
}


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
    
    
    static func getDataWithTypePostGet<T:Decodable>(url : String ,classtype : T.Type, httptype : httpType ,postparam : String? , completionHandler : @escaping (_ dataObject: Any , _ error:String?)->()){
        
        print("\(classtype)")
        
        
        // postparam e.g  aaa=bbbbvalue&ccc=ddddvalue
        
        
        guard let url = URL(string: url) else {return}
        
        var request = URLRequest(url:url,cachePolicy: .reloadIgnoringLocalCacheData)
        
        if (httptype == .post){
            
            request.httpMethod = "POST"
            
            print(postparam!)
            
            guard let postparam = postparam else {return}
            
            print("postparam \(postparam)")
            request.httpBody = postparam.data(using: .utf8)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                
                if let error = error{

                        completionHandler("",error.localizedDescription)
                        return

                }
                
                guard let data = data else {return}
                
                print(data)
                print(String(data: data, encoding: .utf8)!)
                
                guard let list = try? JSONDecoder().decode(classtype, from: data) else {
                    
                    return
                    
                }

                completionHandler(list,nil)
            }
            
            
            
        }
        .resume()
        
        
        
        
        
    }
 
}
