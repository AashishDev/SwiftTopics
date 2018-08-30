//
//  ViewController.swift
//  RealmSwifty
//
//  Created by MOBILE MAC1 on 8/30/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
  
  var items = List<Task>()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    //items.append(Task(value: ["text": "My First Task"]))
   // tableView.reloadData()
  }
  
  func setupUI()  {
    title = "My Tasks"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
  }


  // MARK: UITableView
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    print(items)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.text
    cell.textLabel?.alpha = item.isCompleted ? 0.5 : 1
    
    return cell
  }
  
  @objc func add() {
    let alertController = UIAlertController(title: "New Task", message: "Enter Task Name", preferredStyle: .alert)
    var alertTextField: UITextField!
    alertController.addTextField { textField in
      alertTextField = textField
      textField.placeholder = "Task Name"
    }
    alertController.addAction(UIAlertAction(title: "Add", style: .default) { _ in
      guard let text = alertTextField.text , !text.isEmpty else { return }
      self.items.append(Task(value: ["text": text]))
      self.tableView.reloadData()
    })
    present(alertController, animated: true, completion: nil)
  }
  
}

