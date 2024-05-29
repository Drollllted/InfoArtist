//
//  ViewController.swift
//  InfoArtist
//
//  Created by Drolllted on 26.05.2024.
//

import UIKit

class AristViewController: UIViewController {
    
    private var artistView: ArtistsView!
    
    private let artists = APIRequest.shared
    
    override func loadView() {
        artistView = ArtistsView()
        view = artistView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Artists"
        
        artistView.artistTableView.delegate = self
        artistView.artistTableView.dataSource = self
        
        artists.getArtists()
        print(artists.arrayArtins.first?.bio ?? "String")
    }


}

extension AristViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.arrayArtins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistCell.identifire, for: indexPath) as? ArtistCell else {fatalError("Troubles in TableViewCell")}
        let artists = artists.arrayArtins[indexPath.row]
        cell.imageArtist.image = UIImage(named: artists.image ?? "1")
        cell.nameArtistLabel.text = artists.name
        cell.bioArtistLabel.text = artists.bio
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = ArtistInfoViewController()
        let artists = artists.arrayArtins[indexPath.row]
        
        infoVC.navigationItem.title = artists.name
        infoVC.artistInfo.artistInfoImage.image = UIImage(named: artists.image ?? "1")
        infoVC.artistInfo.artistInfoNameLabel.text = artists.name
        infoVC.artistInfo.artistInfoBioLabel.text = artists.bio
        
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}


