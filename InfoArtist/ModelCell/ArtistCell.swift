//
//  ArtistCell.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class ArtistCell: UITableViewCell {
    
    private let anchor: CGFloat = 15
    static let identifire = "identifire"
    
    lazy var imageArtist: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        return image
    }()
    
    lazy var nameArtistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var bioArtistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setArtistImage()
        
        setNameArtistLabel()
        
        setBioArtistLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setArtistImage() {
        addSubview(imageArtist)
        
        NSLayoutConstraint.activate([
            imageArtist.topAnchor.constraint(equalTo: self.topAnchor, constant: anchor),
            imageArtist.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            imageArtist.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -anchor)
        ])
    }
    
    private func setNameArtistLabel() {
        addSubview(nameArtistLabel)
        
        NSLayoutConstraint.activate([
            nameArtistLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: anchor),
            nameArtistLabel.leadingAnchor.constraint(equalTo: imageArtist.trailingAnchor, constant: anchor),
            nameArtistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setBioArtistLabel() {
        addSubview(bioArtistLabel)
        
        NSLayoutConstraint.activate([
            bioArtistLabel.topAnchor.constraint(equalTo: nameArtistLabel.bottomAnchor, constant: anchor),
            bioArtistLabel.leadingAnchor.constraint(equalTo: imageArtist.trailingAnchor, constant: anchor),
            bioArtistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
}
