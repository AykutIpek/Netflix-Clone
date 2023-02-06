//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by aykut ipek on 2.02.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    // MARK: - Properties
    private lazy var heroImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = bounds
        imageView.image = UIImage(named: "heroImages")
        return imageView
    }()
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        return button
    }()
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        return button
    }()
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroHeaderUIView{
    private func setupUI(){
        style()
        layout()
        addGradient()
    }
    private func style(){
        //Play Button Style
        playButton.translatesAutoresizingMaskIntoConstraints = false
        //Download Button Style
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(heroImageView)
        addSubview(playButton)
        addSubview(downloadButton)
        NSLayoutConstraint.activate([
            //Play Button Layout
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 90),
            //Download Button Layout
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
    }
}


