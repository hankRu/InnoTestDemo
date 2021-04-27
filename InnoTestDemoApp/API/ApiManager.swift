//
//  ApiManager.swift
//  MaskDemoForTL
//
//  Created by Hank Lu on 2020/3/11.
//  Copyright © 2020 Minhan Ru. All rights reserved.
//

import Foundation

struct ApiDomain: DomainChangable {
    var multiDomain: MultiDomain {
        get {
            return MultiDomain(URLs: [""])
        }
        set {
            //StoredDefaults.baseURL.value = newValue.URLs
        }
    }
}

class ApiManager {
    static let shared = ApiManager()
    
    let router = Router()
    
    var domain: ApiDomain = ApiDomain()
}


