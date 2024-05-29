//
//  APIRequest.swift
//  InfoArtist
//
//  Created by Drolllted on 26.05.2024.
//

import Foundation


class APIRequest {
    static let shared = APIRequest()
    
    var arrayArtins: [Artists] = []
    var artistsWork: [Works] = []
    
    private init() {}
    
    func getArtists() {
        guard let url = Bundle.main.url(forResource: "JSONArtist", withExtension: "json") else {
            print("Error json not found")
            return
        }
        do{
            let Data = try Data(contentsOf: url)
//            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
            let decoder = JSONDecoder()
            let json = try decoder.decode(ArtistApi.self, from: Data)
            arrayArtins = json.artists
            artistsWork = json.artists.flatMap{$0.works}
            
            
        }catch{
            print("Error decoding JSON: \(error)")
        }
    }
}
