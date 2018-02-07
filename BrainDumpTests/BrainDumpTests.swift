//
//  BrainDumpTests.swift
//  BrainDumpTests
//
//  Created by Robin on 2018-02-05.
//  Copyright © 2018 Robin. All rights reserved.
//

import XCTest
@testable import BrainDump

class BrainDumpTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    CoreDataManager.shared.deleteTasksData()
    assert(CoreDataManager.shared.retrieveTasks().count==0)
  }
  
  override func tearDown() {
    CoreDataManager.shared.deleteTasksData()
    super.tearDown()
  }
  
  func testCoreData() {
    let coreDataManager = CoreDataManager.shared
    guard (coreDataManager.taskEntity != nil) else {
      assert(false)
    }
    
    coreDataManager.saveTask(title: "Task 1")
    coreDataManager.saveTask(title: "Task 2")
    coreDataManager.saveTask(title: "Task 1")
    coreDataManager.saveTask(title: "Task 3")
    coreDataManager.saveTask(title: "Task 2")
    coreDataManager.saveTask(title: "Task 1")
    let tasks = coreDataManager.retrieveTasks()
    assert(tasks.count == 3)
    for task in tasks {
      guard let title = task.value(forKey: "title") as? String,
      let repeats = task.value(forKey: "repeats") as? Int else {
        assert(false)
        break
      }
      switch (title) {
      case "Task 1":
        assert(repeats == 3)
        break
      case "Task 2":
        assert(repeats == 2)
        break
      case "Task 3":
        assert(repeats == 1)
        break
      default:
        assert(false)
        break
      }
    }
  }
}
