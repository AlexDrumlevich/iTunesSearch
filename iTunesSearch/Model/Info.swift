//
//  Info.swift
//  iTunesSearch
//
//  Created by Друмлевич on 17.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import UIKit

struct Info: Codable {
    var results: [TheInfo] = []
    
//    enum CodingKeys: String, CodingKey {
//        case results
//    }
//
//    init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
//
//        results = try valueContainer.decode([TheInfo].self, forKey: .results)
//    }
}


struct TheInfo: Codable {
    
    var wrapperType: String?
    var kind: String?
    var artistName: String?
    var collectionName:String?
    var trackName: String?
    var artworkUrl100: URL?
    var image: UIImage?

    enum CodingKeys: String, CodingKey {
        case wrapperType
        case kind
        case artistName
        case collectionName
        case trackName
        case artworkUrl100
    }

init(from decoder: Decoder) throws {
    let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    wrapperType = try? valueContainer.decode(String.self, forKey: .wrapperType)
    kind = try? valueContainer.decode(String.self, forKey: .kind)
    artistName = try? valueContainer.decode(String.self, forKey: .artistName)
    collectionName = try? valueContainer.decode(String.self, forKey: .collectionName)
    trackName = try? valueContainer.decode(String.self, forKey: .trackName)
    artworkUrl100 = try? valueContainer.decode(URL.self, forKey: .artworkUrl100)
}
}
