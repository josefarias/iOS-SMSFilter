//
//  ViewController.swift
//  SMSFilter
//
//  Created by Jose Farias on 9/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()

    private var models = [Word]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SMS Filter"
        view.addSubview(tableView)
        getAllWords()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }

    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Word",
                                      message: "Enter new word",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createWord(name: text)
        }))
        
        present(alert, animated: true)
    }
    
    // MARK: - Table View

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit",
                                      message: nil,
                                      preferredStyle: .actionSheet)

        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.deleteWord(word: item)
        }))

        present(sheet, animated: true)
    }

    // MARK: - Core Data

    func getAllWords() {
        do {
            models = try context.fetch(Word.fetchRequest())

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            // error
        }
    }

    func createWord(name: String) {
        let newWord = Word(context: context)
        newWord.name = name
        newWord.createdAt = Date()

        do {
            try context.save()
            getAllWords()
        }
        catch {
            // error
        }
    }
    
    func deleteWord(word: Word) {
        context.delete(word)

        do {
            try context.save()
            getAllWords()
        }
        catch {
            // error
        }
    }
}

