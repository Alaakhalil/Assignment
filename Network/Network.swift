//
//  Network.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class Network{
    
    
    static let instance = Network()

    func fetchData (completion: @escaping (_ response: DataResponse<[ServerData]>, _ error: String?) -> Void) -> Void{
        Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseArray{(response: DataResponse<[ServerData]>) in
            if response.error == nil {
            completion(response, nil)
            
            }
            else{
            
                debugPrint(response.error as Any)
            }
        }
    }
}

