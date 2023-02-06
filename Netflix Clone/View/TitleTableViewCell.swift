//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by aykut ipek on 5.02.2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "TitleTableViewCell"
    private let titlesPosterUIImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    private let playTitleButton : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension TitleTableViewCell{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        //titlesPosterUIImageView style
        titlesPosterUIImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //titleLabel style
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //playTitleLabel style
        playTitleButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        NSLayoutConstraint.activate([
            //Titles Poster UIImageView Layout
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100),
            
            //Title Label Layout
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor , constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
}

extension TitleTableViewCell{
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else {
            return
        }
        titlesPosterUIImageView.sd_setImage(with: url,completed: nil)
        titleLabel.text = model.titleName
    }
}
