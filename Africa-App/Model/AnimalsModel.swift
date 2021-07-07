//
//  AnimalsModel.swift
//  Africa-App
//
//  Created by Victor Lee on 7/7/21.
//

import Foundation

struct AnimalsModel: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
