//
//  ArtistInfoView.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class ArtistInfoView: UIView {
    
    private let anchor: CGFloat = 15
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var artistInfoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        return image
    }()
    
    lazy var artistInfoNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var artistInfoBioLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 12
        
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        return label
    }()
    
    lazy var worksLabel: UILabel = {
        let label = UILabel()
        label.text = "Works"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var worksArtistCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(WorksCell.self
                    , forCellWithReuseIdentifier: WorksCell.identifire)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setMainScrollView()
        
        setMainView()
        
        setArtistInfoImage()
        
        setArtistsNameLabel()
        
        setArtistsBioLabel()
        
        setWorksLabel()
        
        setWorksArtistsCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setMainScrollView() {
        addSubview(mainScrollView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    private func setMainView() {
        mainScrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    private func setArtistInfoImage() {
        mainView.addSubview(artistInfoImage)
        
        NSLayoutConstraint.activate([
            artistInfoImage.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: anchor),
            artistInfoImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            artistInfoImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setArtistsNameLabel() {
        mainView.addSubview(artistInfoNameLabel)
        
        NSLayoutConstraint.activate([
            artistInfoNameLabel.topAnchor.constraint(equalTo: artistInfoImage.bottomAnchor, constant: anchor),
            artistInfoNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            artistInfoNameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setArtistsBioLabel() {
        mainView.addSubview(artistInfoBioLabel)
        
        NSLayoutConstraint.activate([
            artistInfoBioLabel.topAnchor.constraint(equalTo: artistInfoNameLabel.bottomAnchor, constant: anchor),
            artistInfoBioLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            artistInfoBioLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setWorksLabel() {
        mainView.addSubview(worksLabel)
        
        NSLayoutConstraint.activate([
            worksLabel.topAnchor.constraint(equalTo: artistInfoBioLabel.bottomAnchor, constant: 30),
            worksLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            worksLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setWorksArtistsCollectionView() {
        mainView.addSubview(worksArtistCollectionView)
        
        NSLayoutConstraint.activate([
            worksArtistCollectionView.topAnchor.constraint(equalTo: worksLabel.bottomAnchor, constant: anchor),
            worksArtistCollectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            worksArtistCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor),
            worksArtistCollectionView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }
    
}
