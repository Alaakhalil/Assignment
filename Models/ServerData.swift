//
//  List .swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import Foundation
import ObjectMapper

class ServerData:NSObject, Mappable{
    
    var albumId: Int? = 0
    var id: Int? = 0
    var url: String? = ""
    var title: String? = ""
    var thumbnailUrl: String? = ""
    
    required init(map: Map){
    
    }
    
    func mapping(map: Map){
        
        albumId         <- map["albumId"]
        id              <- map["id"]
        url             <- map["url"]
        title           <- map["title"]
        thumbnailUrl    <- map["thumbnailUrl"]
        
    }
    
}
