//
//  IdeasViewController.swift
//  BrainDump
//
//  Created by Robin on 2018-02-06.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit
import CoreData
import SideMenu
import SwiftIcons

class TasksViewController: UIViewController {
  
  let tableview = UITableView()
  var model = [NSManagedObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Set up menu button
    let menuIcon = UIBarButtonItem()
    menuIcon.setIcon(icon: .fontAwesome(.bars), iconSize: 30, color: UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1), cgRect: CGRect(x: 0, y: 0, width: 30, height: 30), target: self, action: #selector(self.openSideMenu))
    navigationItem.leftBarButtonItem = menuIcon
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    model = CoreDataManager.shared.retrieveTasks()
    tableview.reloadData()
  }
  
  override func loadView() {
    super.loadView();
    view = tableview
    tableview.dataSource = self
    tableview.delegate = self
    tableview.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func openSideMenu() {
    if let menuController = SideMenuManager.menuLeftNavigationController {
      present(menuController, animated: true, completion: nil)
    }
  }
}

extension TasksViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
    cell.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    guard let title = model[indexPath.row].value(forKey: "title") as? String,
      let priority = model[indexPath.row].value(forKey: "repeats") as? Int else { return UITableViewCell() }
    cell.textLabel?.text = title
    cell.detailTextLabel?.text = String(priority)
    return cell
  }
}

extension TasksViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
