//
//  ViewController.swift
//  SwiftyCoreData
//
//  Created by MOBILE MAC1 on 8/21/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  var tableDataArray = [NSManagedObject]()
  
  @IBOutlet var tablevw: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    //1 Appdelegate Object
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    //2 ManageContext
    let manageContext = appDelegate.persistentContainer.viewContext
    
    //3 Fetch Request
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee")
    
    // Retrive data from core data
    do {
      
      tableDataArray = try manageContext.fetch(fetchRequest)
      self.tablevw.reloadData()
    } catch let error as NSError {
      
      print("Retiving data error is : \(error.localizedDescription)")
    }
    
  }
  
  
  //1 Add Button Clicked ****
  @IBAction func addNewItemBtnTapped(_ sender: UIButton) {
    
    let alert = UIAlertController(title: "New Item", message: "Add a new name", preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      
      guard let textField = alert.textFields?.first,
        let nameToSave = textField.text else {
          return
      }
      self.save(name: nameToSave)
      self.tablevw.reloadData()
    }
    
    alert.addTextField()
    alert.addAction(saveAction)
    present(alert, animated: true)
  }
  
  func save(name:String) {
    
    guard let appdelagate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    
    //2 ManageContext
    let manageContext = appdelagate.persistentContainer.viewContext
    
    //3 Entity
    let entity = NSEntityDescription.entity(forEntityName: "Employee", in: manageContext)
    
    //4
    let employee = NSManagedObject(entity: entity!, insertInto: manageContext)
    employee.setValue(name, forKey: "name")
    
    //5 Save in Core data model
    do{
      try manageContext.save()
      print("Sucessfully Saved")

      tableDataArray.append(employee)
    } catch let error as NSError {
      print("Could not save: \(error)")
    }
    
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}


//1 UITableview Method ************
extension ViewController : UITableViewDataSource,UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableDataArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    if cell == nil {
      cell = UITableViewCell(style:.subtitle, reuseIdentifier: "cell")
    }
    
    let employee = tableDataArray[indexPath.row]
    cell?.textLabel?.text = employee.value(forKey: "name") as? String
    cell?.detailTextLabel?.text = "21/08/2018"
    return cell!
  }
  
}

