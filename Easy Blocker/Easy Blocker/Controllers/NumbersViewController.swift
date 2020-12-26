//
//  NumbersViewController.swift
//  Easy Blocker
//
//  Created by Vitaliy Podolskiy on 12/26/20.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var numbers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numbers = [
            "+ 7 000 000 00 00",
            "+ 7 000 000 00 01",
            "+ 7 000 000 00 02",
            "+ 7 000 000 00 03"
        ]
        
        tableView.reloadData()
    }
    
    @IBAction func onAdd(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(
            title: "Добавление номера",
            message: "Введите номер для добавления в БД",
            preferredStyle: .alert
        )
        alertController.addTextField { (textField) in
            textField.placeholder = "+7 000 000 00 00"
            textField.keyboardType = .phonePad
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                print(text)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension NumbersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = numbers[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
