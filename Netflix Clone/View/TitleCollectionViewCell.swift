//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by aykut ipek on 5.02.2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension TitleCollectionViewCell{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        //Poster Image View Style
        posterImageView.frame = contentView.bounds
    }
    private func layout(){
        contentView.addSubview(posterImageView)
    }
}

extension TitleCollectionViewCell{
    public func configure(with model: String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }
        
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
