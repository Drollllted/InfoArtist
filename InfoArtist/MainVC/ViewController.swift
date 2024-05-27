//
//  ViewController.swift
//  InfoArtist
//
//  Created by Drolllted on 26.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var artistView: ArtistsView!
    
    private let artists = APIRequest.shared
    private let artMens = [ArtistApi]()
    
    override func loadView() {
        artistView = ArtistsView()
        view = artistView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        artists.getArtists()
        print(artMens)
    }


}

