//
//  ViewModel.swift
//  Stock
//
//  Created by ctsuser on 5/21/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import Foundation
import Alamofire

class ViewModel {
  func getData(symbol: String, completion: @escaping (avgSMA) -> Void){
    Alamofire.request("http://127.0.0.1:5000/\(symbol)")
      .responseString { response in
        guard response.result.isSuccess, let _ = response.result.value , let data = response.data else {
          print("Error while getting response : \(String(describing: response.result.error))")
          return
        }
        do {
          let dat = try JSONDecoder().decode(avgSMA.self, from: data)
          completion(dat)
        }
        catch {
          print(error.localizedDescription)
        }
    }
  }
}
