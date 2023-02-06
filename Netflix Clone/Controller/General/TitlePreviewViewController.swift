//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by aykut ipek on 6.02.2023.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    //MARK: - Properties
    private let webView: WKWebView = {
        let webView = WKWebView()
        
        return webView
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22,weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    private let overviewLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18,weight: .regular)
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    private let downloadButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20 / 4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Helpers
extension TitlePreviewViewController{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        //Title Label Style
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //overviewLabel Style
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Download Button Style
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Web View Style
        webView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        NSLayoutConstraint.activate([
            //Web View Layout
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func configure(with model: TitlePreviewViewModel){
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
}


