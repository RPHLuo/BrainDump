//
//  CoreDataManager.swift
//  BrainDump
//
//  Created by Robin on 2018-02-06.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataManager {
  var appDelegate:AppDelegate!
  var managedContext:NSManagedObjectContext!
  var taskEntity:NSEntityDescription!
  //var tagEntity:NSEntityDescription
  
  static var shared = CoreDataManager()
  
  init() {
    guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = delegate.persistentContainer.viewContext
    guard let taskEntity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext) else { return }
    self.appDelegate = delegate
    self.managedContext = managedContext
    self.taskEntity = taskEntity
  }
  
  //TODO check if data exists. if it does then simply update it
  //Save Task
  func saveTask(title: String) {
    let task = NSManagedObject(entity: taskEntity, insertInto: managedContext)
    let currentDate = Date()
    task.setValue(title, forKey: "title")
    task.setValue(1, forKey: "repeats")
    task.setValue(currentDate, forKey: "dateCreated")
    task.setValue(currentDate, forKey: "dateModified")
    do {
      try managedContext.save()
    } catch let e as NSError {
      print("\(e)")
    }
  }
  
  //Get Tasks from Core Data
  func retrieveTasks() -> [NSManagedObject] {
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
    do {
      let tasks = try managedContext.fetch(fetchRequest)
      return tasks
    } catch let e as NSError {
      print("\(e)")
      return []
    }
  }
  
}
