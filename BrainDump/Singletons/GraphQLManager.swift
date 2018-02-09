//
//  GraphQLManager.swift
//  BrainDump
//
//  Created by Robin on 2018-02-07.
//  Copyright © 2018 Robin. All rights reserved.
//

import Foundation
import Apollo

class GraphQLManager {
  let apollo = ApolloClient(url: URL(string: "https://api.graph.cool/simple/v1/cjddwa90359su0103b36ezi2i")!)
  static let shared = GraphQLManager()
  
  func uploadTask(title: String, repeats: Int) {
    let findTaskQuery = TitleTaskQuery(title: title)
    apollo.fetch(query: findTaskQuery) {
      result, error in
      if let task = result?.data?.task {
        guard let queryTaskRepeats = task.repeats else { return }
        let updateTask = UpdateTaskRepeatsMutation(id: task.id, title: title, repeats: repeats + queryTaskRepeats)
        self.apollo.perform(mutation: updateTask)
      } else {
        let createTask = CreateTaskMutation(title: title, repeats: repeats)
        self.apollo.perform(mutation: createTask)
      }
    }
  }
  
  func getTasks(handler: GraphQLHandler) {
    let allTasksQuery = AllTasksQuery()
    var tasksArray = [TaskInformation]()
    apollo.fetch(query: allTasksQuery) {
      result, error in
      guard let tasks = result?.data?.allTasks else { return }
      tasksArray = tasks.map { $0.fragments.taskInformation }
      handler.handleAllTasks(tasks: tasksArray)
    }
  }
  
  func findTask(title: String, handler: GraphQLHandler) {
    let findTaskQuery = TitleTaskQuery(title: title)
    apollo.fetch(query: findTaskQuery) {
      result, error in
      guard let task = result?.data?.task else { return }
      handler.handleFindTask(task: task)
    }
  }
}
