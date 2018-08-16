//
//  ViewController.swift
//  NSCodingSwift
//
//  Created by MOBILE MAC1 on 8/16/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit


var tableData = [User]()
class ViewController: UIViewController {
  
  @IBOutlet var tableVw: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableVw.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableData = loadJsonFromLocalFile(fileName: "users")!
    
    if let tableDataArray = loadJsonFromLocalFile(fileName: "users") {
      if(tableDataArray.count > 0){
       
        tableVw.reloadData()
      }
    }
  }
  
  func loadJsonFromLocalFile(fileName:String) -> [User]? {
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
      
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(Array<User>.self, from: data)
        return jsonData
      }
      catch {
        print("Error : \(error)")
      }
    }
    return nil
  }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource  {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
   return tableData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?)!
    cell = UITableViewCell.init(style:.subtitle, reuseIdentifier: "cell")
    let user = tableData[indexPath.row]
    cell.textLabel?.text = user.name
    //cell.detailTextLabel?.text = user.address.city
    cell.detailTextLabel?.text = user.address.geo.lat
    
    return cell
  }
}


