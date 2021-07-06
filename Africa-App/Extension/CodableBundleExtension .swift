//
//  CodableBundleExtension .swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate file \(file) in Bundle")
        }
        
        //Crete a property for data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle ")
        }
        //create a decoder
        let decoder = JSONDecoder()
        // create a property for the decoded data
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
