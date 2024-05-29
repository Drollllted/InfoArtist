//
//  ArtistInfoViewController.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class ArtistInfoViewController: UIViewController{
    
    var artistInfo: ArtistInfoView
    var artistsWork = APIRequest.shared
    
    init() {
        self.artistInfo = ArtistInfoView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = artistInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        artistInfo.worksArtistCollectionView.delegate = self
        artistInfo.worksArtistCollectionView.dataSource = self
        
        print(artistsWork.artistsWork)
        
    }
}

extension ArtistInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistsWork.artistsWork.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorksCell.identifire, for: indexPath) as? WorksCell else {fatalError("troubles in WorksColletionView")}
        
        
        return cell
    }
    
    
}
