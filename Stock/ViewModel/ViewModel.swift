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
                let ticker = details["ticker"]!
                let price = details["price"]!
                let name = details["name"]!
                let numStocks = details["numStocks"]!
                let totStockPrice = details["totStockPrice"]!
                let stock = boughtStock(ticker: ticker, price: price, name: name, numStocks: numStocks, totStockPrice: totStockPrice)
                stocks += [stock]
            }
            completion(stocks)
        }
    }
    
    func getStocksSold(completion: @escaping ([stockSold]?) -> Void){
          Alamofire.request("http://192.168.0.20:5000/stocksSold")
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
              var stocks = [stockSold]()
              for details in data {
                  let timeSold = details["timeSold"]!
                  let name = details["name"]!
                  let ticker = details["ticker"]!
                  let priceBought = details["priceBought"]!
                  let priceNow = details["priceNow"]!
                  let numStocksBought = details["numStocksBought"]!
                let stock = stockSold(timeSold: timeSold, name: name, ticker: ticker, priceBought: priceBought, priceNow: priceNow, numStocksBought: numStocksBought)
                  stocks += [stock]
              }
              completion(stocks)
          }
    }
    
}
