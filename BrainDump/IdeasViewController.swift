//
//  IdeasViewController.swift
//  BrainDump
//
//  Created by Robin on 2018-02-06.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit
import CoreData

class IdeasViewController: UIViewController {
  
  let tableview = UITableView()
  var model = [NSManagedObject]()
  
  var appDelegate:AppDelegate!
  var managedContext:NSManagedObjectContext!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //Set up Persistence
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      self.appDelegate = delegate
      managedContext = appDelegate.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
      do {
        model = try managedContext.fetch(fetchRequest)
        tableview.reloadData()
      } catch let e as NSError {
        print("\(e)")
      }
    } else {
      //Persistence does not work
    }
    
    
    
  }
  
  override func loadView() {
    super.loadView();
    view = tableview
    tableview.dataSource = self
    tableview.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

extension IdeasViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
    guard let title = model[indexPath.row].value(forKey: "title") as? String,
      let priority = model[indexPath.row].value(forKey: "repeats") as? Int else { return UITableViewCell() }
    cell.textLabel?.text = title
    cell.detailTextLabel?.text = String(priority)
    return cell
  }
  
  
}

extension IdeasViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
