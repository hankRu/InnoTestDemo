//
//  JsonplaceholderData.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import Foundation

struct JsonplaceholderData: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
