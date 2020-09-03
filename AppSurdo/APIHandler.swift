//
//  APIHandler.swift
//  AppSurdo
//
//  Created by Luis Pereira on 03/09/20.
//  Copyright © 2020 Luis Pereira. All rights reserved.
//

import Foundation

class APIHandler{
    
    var fact:RandomFact = RandomFact()
    
    func loadFactWithNumber(number:Int) {
        let urlStrin = "http://numbersapi.com/" + String(number)
        let url = URL(string: urlStrin)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in do {
            
            //let decoder = JSONDecoder()
            let jsonData = String(data: data!, encoding: .utf8) as String?
            //self.fact = jsonData
            print(jsonData!)
            DispatchQueue.main.async {
            
            }
        } catch {
            print("Deu ruim")
            }
        }
      
        task.resume()
    }
}
