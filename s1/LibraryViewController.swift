//
//  LibraryViewController.swift
//  s1
//
//  Created by Aleksandr  on 06.04.2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    private let words: [String] = ["apple", "banana", "cherry", "date", "elderberry", "fig", "grape", "honeydew", "kiwi", "lemon"]
    
    private let translations: [String: String] = [
        "apple": "яблоко",
        "banana": "банан",
        "cherry": "вишня",
        "date": "финик",
        "elderberry": "бузина",
        "fig": "инжир",
        "grape": "виноград",
        "honeydew": "медовый мелон",
        "kiwi": "киви",
        "lemon": "лимон"
    ]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dictionary"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension DictionaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let word = words[indexPath.row]
        let translation = translations[word] ?? "N/A"
        cell.textLabel?.text = "\(word) - \(translation)"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DictionaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = words[indexPath.row]
        let translation = translations[word] ?? "N/A"
        let alert = UIAlertController(title: word, message: translation, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
