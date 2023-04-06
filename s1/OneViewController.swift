//
//  OneViewController.swift
//  s1
//
//  Created by Aleksandr  on 06.04.2023.
//

import UIKit

class OneFlashcardViewController: UIViewController {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Карточки"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Word"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let translationLabel: UILabel = {
        let label = UILabel()
        label.text = "Translation"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    
    // MARK: - Private methods
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(wordLabel)
        view.addSubview(translationLabel)
        view.addSubview(imageView)
        view.addSubview(nextButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            wordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            translationLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 16),
            translationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            translationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: translationLabel.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
