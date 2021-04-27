//
//  JsonplaceholderRequest.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import Foundation

struct JsonplaceholderRequest: Request {
    typealias Response = [JsonplaceholderData]
    
    var multiDomain: MultiDomain {
        return MultiDomain(URLs: ["https://jsonplaceholder.typicode.com/"])
    }
    
    var path: String {
        return "photos"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var urlParameters: Parameters? {
        return [:]
    }
    
    var bodyEncoding: ParameterEncoding? {
        return .urlEncoding
    }
    
    var headers: HTTPHeaders? {
        return [:]
    }
}
