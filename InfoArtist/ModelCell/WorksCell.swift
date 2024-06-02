//
//  WorksCell.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class WorksCell: UICollectionViewCell {
    
    private let anchor: CGFloat = 15
    static let identifire = "identifire"
    private var works: Works!
    
    lazy var worksImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return image
    }()
    
    lazy var titleWorksLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var infoWorksLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 15
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func configure(with work: Works) {
        
        self.worksImage.image = UIImage(named: works.image ?? "1")
        self.titleWorksLabel.text = works.title
        self.infoWorksLabel.text = works.info
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        layer.cornerRadius = 15
        
        setWorksImage()
        
        setTitleWorksLabel()
        
        setInfoWorksLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setWorksImage() {
        addSubview(worksImage)
        
        NSLayoutConstraint.activate([
            worksImage.topAnchor.constraint(equalTo: self.topAnchor, constant: anchor),
            worksImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            worksImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setTitleWorksLabel() {
        addSubview(titleWorksLabel)
        
        NSLayoutConstraint.activate([
            titleWorksLabel.topAnchor.constraint(equalTo: worksImage.bottomAnchor, constant: anchor),
            titleWorksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            titleWorksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
        
    }
    
    private func setInfoWorksLabel() {
        addSubview(infoWorksLabel)
        
        NSLayoutConstraint.activate([
            infoWorksLabel.topAnchor.constraint(equalTo: titleWorksLabel.bottomAnchor, constant: anchor),
            infoWorksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            infoWorksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        
        ])
    }
    
}
