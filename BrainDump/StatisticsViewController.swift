//
//  StatisticsViewController.swift
//  BrainDump
//
//  Created by Robin on 2018-02-07.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit
import SideMenu
import SwiftIcons

protocol GraphQLHandler {
  func handleAllTasks(tasks: [TaskInformation])
  func handleFindTask(task: TitleTaskQuery.Data.Task)
}

class StatisticsViewController: UIViewController {
  
  var model = [TaskInformation]()
  let tableview = UITableView()
  let search = UITextField()
  let upload = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Set up menu button
    let menuIcon = UIBarButtonItem()
    menuIcon.setIcon(icon: .fontAwesome(.bars), iconSize: 30, color: UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1), cgRect: CGRect(x: 0, y: 0, width: 30, height: 30), target: self, action: #selector(self.openSideMenu))
    navigationItem.leftBarButtonItem = menuIcon
    
    tableview.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    search.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    upload.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    tableview.dataSource = self
    
    view.addSubview(tableview)
    view.addSubview(search)
    view.addSubview(upload)
    upload.setTitle("Upload", for: .normal)
    upload.setTitleColor(.black, for: .normal)
    
    search.addTarget(self, action: #selector(filter), for: .editingChanged)
    upload.addTarget(self, action: #selector(uploadTasks), for: .touchUpInside)
    
    tableview.translatesAutoresizingMaskIntoConstraints = false
    search.translatesAutoresizingMaskIntoConstraints = false
    upload.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
      tableview.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
      tableview.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
      tableview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.9),
      search.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: -16),
      search.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
      search.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.65),
      search.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.07),
      upload.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: -16),
      upload.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
      upload.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
      upload.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.07)
      ])
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    GraphQLManager.shared.getTasks(handler: self)
  }
  
  @objc func filter() {
    
  }
  
  @objc func uploadTasks() {
    let tasks = CoreDataManager.shared.retrieveTasks()
    for task in tasks {
      guard let title = task.value(forKey: "title") as? String,
      let repeats = task.value(forKey: "repeats") as? Int else { return }
      GraphQLManager.shared.uploadTasks(title: title)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {() in
      GraphQLManager.shared.getTasks(handler: self)
    })
    CoreDataManager.shared.deleteTasksData()
  }
  
}

extension StatisticsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
    cell.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    var task = model[indexPath.row]
    cell.textLabel?.text = task.title
    guard let repeats = task.repeats else { return cell }
    cell.detailTextLabel?.text = String(repeats)
    return cell
  }
  
  @objc func openSideMenu() {
    if let menuController = SideMenuManager.menuLeftNavigationController {
      present(menuController, animated: true, completion: nil)
    }
  }
}

extension StatisticsViewController: GraphQLHandler {
  func handleFindTask(task: TitleTaskQuery.Data.Task) {
    
  }
  
  func handleAllTasks(tasks: [TaskInformation]) {
    model = tasks
    tableview.reloadData()
  }
}
