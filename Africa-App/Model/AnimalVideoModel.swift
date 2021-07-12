//
//  AnimalVideoModel.swift
//  Africa-App
//
//  Created by Victor Lee on 12/7/21.
//

import Foundation

struct AnimalVideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

