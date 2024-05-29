//
//  ArtistsView.swift
//  InfoArtist
//
//  Created by Drolllted on 27.05.2024.
//

import UIKit

class ArtistsView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Models
    var artistTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArtistCell.self, forCellReuseIdentifier: ArtistCell.identifire)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    //MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setArtistTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setArtistTableView() {
        addSubview(artistTableView)
        
        NSLayoutConstraint.activate([
            artistTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            artistTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            artistTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            artistTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
