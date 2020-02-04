//
//  ViewModel.swift
//  Stock
//
//  Created by ctsuser on 5/21/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ViewModel {
    
    let decoder = JSONDecoder()
    
    func getStocksBought(completion: @escaping ([boughtStock]?) -> Void){
        Alamofire.request("http://192.168.0.20:5000/stocksBought")
          .responseJSON{ response in
            guard response.result.isSuccess else {
                print("Error while getting response : \(String(describing: response.result.error))")
                completion(nil)
                return
            }
            guard let data = response.result.value as? [Dictionary<String, String>] else {
                print("couldn't get data")
                return
            }
            var stocks = [boughtStock]()
            for details in data {
                let json = try? JSONSerialization.data(withJSONObject: details)
                let stock = try? self.decoder.decode(boughtStock.self, from: json!)
                stocks += [stock!]
            }
            completion(stocks)
        }
    }
    
    func getStocksSold(completion: @escaping ([stockSold]?) -> Void){
          Alamofire.request("http://192.168.0.20:5000/stocksSold")
            .responseJSON{ response in
              guard response.result.isSuccess else {
                  print("Error while getting response: \(String(describing: response.result.error))")
                  completion(nil)
                  return
              }
              guard let data = response.result.value as? [Dictionary<String, Any>] else {
                  print("couldn't get data")
                  completion(nil)
                  return
              }
                var stocks = [stockSold]()
                for info in data {
                    let json = try? JSONSerialization.data(withJSONObject: info)
                    let stock = try? self.decoder.decode(stockSold.self, from: json!)
                    stocks += [stock!]
                }
                completion(stocks)
          }
    }
    
    func getFinalResults(completion: @escaping (finalResult?) -> Void) {
        Alamofire.request("http://192.168.0.20:5000/finalResults")
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while getting response: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                guard let data = response.result.value else {
                    print("couldn't properly format data")
                    return
                }
                do {
                    let json = try JSONSerialization.data(withJSONObject: data)
                    let finalr = try self.decoder.decode(finalResult.self, from: json)
                    completion(finalr)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        Alamofire.request( "http://192.168.0.20:5000/login/", method: .post, parameters: ["username": username, "password" : password])
        .responseJSON { response in
            guard response.result.isSuccess else {
                print("Error while getting response: \(String(describing: response.result.error))")
                completion(false)
                return
            }
            if response.response?.statusCode == 200 {
                print("Success")
                completion(true)
                return()
            }
            else {
                print("JSON data is nil.")
                completion(false)
            }
         }
    }
    
}
