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
    
    //https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json
    
    private init() {}
    
    func getArtists() {
        guard let url = Bundle.main.url(forResource: "JSONArtist", withExtension: "json") else {
            print("Error json not found")
            return
        }
        do{
            let Data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let json = try decoder.decode(ArtistApi.self, from: Data)
            arrayArtins = json.artists
            //            artistsWork = json.artists.flatMap{$0.works}
            
        }catch{
            print("Error decoding JSON: \(error)")
        }
    }
}
