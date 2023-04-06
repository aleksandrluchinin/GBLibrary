//
//  ViewController.swift
//  s1
//
//  Created by Aleksandr  on 06.04.2023.
//

import UIKit
import AVFoundation // для встроенного синтезатора речи

class Flashcard {
    var nativeWord: String
    var foreignWord: String
    var image: UIImage?
    
    init(nativeWord: String, foreignWord: String, image: UIImage? = nil) {
        self.nativeWord = nativeWord
        self.foreignWord = foreignWord
        self.image = image
    }
}

class FlashcardSet {
    var name: String
    var flashcards: [Flashcard]
    var progress: [Int] // количество проходов для каждой карточки
    
    init(name: String, flashcards: [Flashcard]) {
        self.name = name
        self.flashcards = flashcards
        self.progress = Array(repeating: 0, count: flashcards.count)
    }
}

class FlashcardViewController: UIViewController {
    var flashcardSet: FlashcardSet
    var currentFlashcardIndex: Int = 0
    
    let foreignWordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let nativeWordLabel: UILabel = {
        let label = UILabel()
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
    
    let speechSynthesizer = AVSpeechSynthesizer() // для встроенного синтезатора речи
    
    init(flashcardSet: FlashcardSet) {
        self.flashcardSet = flashcardSet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(foreignWordLabel)
        view.addSubview(nativeWordLabel)
        view.addSubview(imageView)
        
        // расположение элементов на экране
        foreignWordLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignWordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        foreignWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        foreignWordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        nativeWordLabel.translatesAutoresizingMaskIntoConstraints = false
        nativeWordLabel.topAnchor.constraint(equalTo: foreignWordLabel.bottomAnchor, constant: 16).isActive = true
        nativeWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nativeWordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: nativeWordLabel.bottomAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
    }
    
    
    
}
