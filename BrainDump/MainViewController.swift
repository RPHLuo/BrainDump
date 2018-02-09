//
//  ViewController.swift
//  BrainDump
//
//  Created by Robin on 2018-02-05.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit
import CoreData
import SideMenu

struct ColorScheme {
  static let mainColor = UIColor(red: 0.2, green: 0.25, blue: 0.7, alpha: 1)
  static let secondaryColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
  static let textColor = UIColor(red: 0.15, green: 0.2, blue: 0.4, alpha: 1)
}

class MainViewController: UIViewController {
  
  let titleView = UILabel()
  let taskTitle = UITextField()
  let submit = UIButton()
  let sideMenu = SideMenuViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Set up SideMenu
    sideMenu.viewControllers = [self, TasksViewController(), StatisticsViewController()]
    sideMenu.currentViewController = self
    let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenu)
    SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
    SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
    SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
    
    //Set up menu button
    let menuIcon = UIBarButtonItem()
    menuIcon.setIcon(icon: .fontAwesome(.bars), iconSize: 30, color: ColorScheme.secondaryColor, cgRect: CGRect(x: 0, y: 0, width: 30, height: 30), target: self, action: #selector(self.openSideMenu))
    navigationItem.leftBarButtonItem = menuIcon
    
    titleView.text = "Store your ideas!"
    titleView.adjustsFontSizeToFitWidth = true
    titleView.font = titleView.font.withSize(64)
    titleView.textAlignment = .center
    taskTitle.borderStyle = .roundedRect
    submit.setTitleColor(.black, for: .normal)
    submit.setTitle("Submit", for: .normal)
    
    submit.addTarget(self, action: #selector(enterIntoDatabase(_:)), for: .touchUpInside)
    
    view.addSubview(titleView)
    view.addSubview(taskTitle)
    view.addSubview(submit)
    
    titleView.translatesAutoresizingMaskIntoConstraints = false
    taskTitle.translatesAutoresizingMaskIntoConstraints = false
    submit.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      taskTitle.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      taskTitle.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
      taskTitle.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.07),
      taskTitle.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
      titleView.bottomAnchor.constraint(equalTo: taskTitle.topAnchor, constant: -32),
      titleView.centerXAnchor.constraint(equalTo: taskTitle.centerXAnchor),
      titleView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2),
      titleView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
      submit.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 16),
      submit.centerXAnchor.constraint(equalTo: taskTitle.centerXAnchor),
      submit.heightAnchor.constraint(equalTo: taskTitle.heightAnchor, multiplier: 1),
      submit.widthAnchor.constraint(equalTo: taskTitle.widthAnchor, multiplier: 1)
      ])
    
  }
  
  @objc func enterIntoDatabase(_ sender: UIGestureRecognizer) {
    if let task = taskTitle.text {
      if (task != "") {
        CoreDataManager.shared.saveTask(title: task)
        taskTitle.text = ""
      }
    }
  }
  
  @objc func openSideMenu() {
    if let menuController = SideMenuManager.menuLeftNavigationController {
      present(menuController, animated: true, completion: nil)
    }
  }
  
  
}
