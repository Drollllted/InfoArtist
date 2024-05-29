//
//  WorksCell.swift
//  InfoArtist
//
//  Created by Drolllted on 29.05.2024.
//

import UIKit

class WorksCell: UICollectionViewCell {
    
    static let identifire = "identifire"
    
    lazy var worksImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
