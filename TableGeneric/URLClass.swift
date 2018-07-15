//
//  URLClass.swift
//  jsonDecode
//
//  Created by Kausik Jati on 10/07/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import Foundation

class URLClass: NSObject {
    
    static let sharedInstance : URLClass = {
        let instance = URLClass()
        return instance
    }()
    
    fileprivate override init() {
    }
    
    public func getData(for url: URL, completion: @escaping JsonTutorialCompletion) {
        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard error == nil else {
                completion(nil , error)
                return
            }
            guard let jsonData = data else {
                completion(nil , error)
                return
            }
            do{
                let tutorial = try JSONDecoder().decode([Tutorial].self, from: jsonData)
                DispatchQueue.main.async {
                    completion(tutorial, nil)
                }
                
            }catch let decodeError {
                completion(nil , decodeError)
            }
        }
        task.resume()
    }
    
}
