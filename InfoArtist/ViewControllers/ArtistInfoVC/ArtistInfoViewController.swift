//
//  ArtistInfoViewController.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class ArtistInfoViewController: UIViewController{
    
    var artistInfo: ArtistInfoView
    var artistsWorkRequest = APIRequest.shared
    
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
        
        //let selectedArtist = artistsWorkRequest.arrayArtins[selectedArtistIndex]
        
       // print(artistsWorkRequest.artistsWork)
        
    }
}

extension ArtistInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistsWorkRequest.arrayArtins.flatMap{$0.works}.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorksCell.identifire, for: indexPath) as? WorksCell else {fatalError("troubles in WorksColletionView")}
        
//        if let cell = cell as? WorksCell {
//            let work = artistsWorkRequest.artistsWork[indexPath.item]
//            print(work)
//        }
        
        let selectedArtist = artistsWorkRequest.arrayArtins[indexPath.item]
        let works = selectedArtist.works
        //cell.configure(with: works)
        
        
//        let works = artistsWorkRequest.arrayArtins.flatMap({$0.works})
//        let arraysWorks = works.first?.title
//        print(arraysWorks)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension ArtistInfoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}
