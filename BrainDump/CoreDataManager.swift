//
//  CoreDataManager.swift
//  BrainDump
//
//  Created by Robin on 2018-02-06.
//  Copyright © 2018 Robin. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  var appDelegate:AppDelegate
  var managedContext:NSManagedObjectContext
  
  init(appDelegate:AppDelegate, managedContext: NSManagedObjectContext) {
    self.appDelegate = appDelegate
    self.managedContext = managedContext
    
  }
  
  func saveTask() {
    
  }
  
  func retrieveTasks() {
    
  }
  
}
