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

class MainViewController: UIViewController {
  
  let titleView = UILabel()
  let taskTitle = UITextField()
  let submit = UIButton()
  var appDelegate:AppDelegate!
  var managedContext:NSManagedObjectContext!
  let sideMenu = SideMenuViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Set up SideMenu
    sideMenu.viewControllers = [self, IdeasViewController()]
    sideMenu.currentViewController = self
    let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenu)
    SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
    SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
    SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
    
    //Set up Persistence
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      self.appDelegate = delegate
      managedContext = appDelegate.persistentContainer.viewContext
    } else {
      //Persistence does not work
    }
    
    titleView.text = "Store your ideas!"
    titleView.adjustsFontSizeToFitWidth = true
    titleView.font = titleView.font.withSize(64)
    titleView.textAlignment = .center
    
    taskTitle.borderStyle = .roundedRect
    submit.tintColor = .black
    submit.setTitleColor(.red, for: .normal)
    submit.setTitle("Submit", for: .normal)
    
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
    submit.addTarget(self, action: #selector(enterIntoDatabase(_:)), for: .touchUpInside)
  }
  
  @objc func enterIntoDatabase(_ sender: UIGestureRecognizer) {
    if let task = taskTitle.text {
      saveTask(title: task)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

//:MARK PERSISTENCE
extension MainViewController {
  func saveTask(title:String) {
    guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext) else { return }
    let task = NSManagedObject(entity: entity, insertInto: managedContext)
    let currentDate = Date()
    task.setValue(title, forKey: "title")
    task.setValue(1, forKey: "repeats")
    task.setValue(currentDate, forKey: "dateCreated")
    task.setValue(currentDate, forKey: "dateModified")
    do {
      try managedContext.save()
    } catch {
      print("could not save")
    }
  }
  
  func saveTag(title:String) {
    guard let entity = NSEntityDescription.entity(forEntityName: "Tag", in: managedContext) else { return }
    let task = NSManagedObject(entity: entity, insertInto: managedContext)
    task.setValue("", forKey: "title")
    
    
    do {
      try managedContext.save()
      
    } catch {
      print("could not save")
    }
  }
}

