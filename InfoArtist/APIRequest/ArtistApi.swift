//
//  JSONParsing.swift
//  InfoArtist
//
//  Created by Drolllted on 26.05.2024.
//

import Foundation

struct ArtistApi: Codable{
    let artists: [Artists]
    
}

struct Artists: Codable{
    let name: String
    let bio: String
    let image: String?
    let works: [Works]
}

struct Works: Codable{
    let title: String
    let image: String?
    let info: String
}
