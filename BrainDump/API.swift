//  This file was automatically generated and should not be edited.

import Apollo

public final class CreateTaskMutation: GraphQLMutation {
  public static let operationString =
    "mutation createTask($title: String!, $repeats: Int!) {\n  createTask(title: $title, repeats: $repeats) {\n    __typename\n    id\n    title\n    repeats\n  }\n}"

  public var title: String
  public var repeats: Int

  public init(title: String, repeats: Int) {
    self.title = title
    self.repeats = repeats
  }

  public var variables: GraphQLMap? {
    return ["title": title, "repeats": repeats]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTask", arguments: ["title": GraphQLVariable("title"), "repeats": GraphQLVariable("repeats")], type: .object(CreateTask.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTask: CreateTask? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTask": createTask.flatMap { $0.snapshot }])
    }

    public var createTask: CreateTask? {
      get {
        return (snapshot["createTask"] as? Snapshot).flatMap { CreateTask(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTask")
      }
    }

    public struct CreateTask: GraphQLSelectionSet {
      public static let possibleTypes = ["Task"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("repeats", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, repeats: Int? = nil) {
        self.init(snapshot: ["__typename": "Task", "id": id, "title": title, "repeats": repeats])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var repeats: Int? {
        get {
          return snapshot["repeats"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "repeats")
        }
      }
    }
  }
}

public final class UpdateTaskRepeatsMutation: GraphQLMutation {
  public static let operationString =
    "mutation updateTaskRepeats($id: ID!, $title: String!, $repeats: Int!) {\n  updateTask(id: $id, title: $title, repeats: $repeats) {\n    __typename\n    ...TaskInformation\n  }\n}"

  public static var requestString: String { return operationString.appending(TaskInformation.fragmentString) }

  public var id: GraphQLID
  public var title: String
  public var repeats: Int

  public init(id: GraphQLID, title: String, repeats: Int) {
    self.id = id
    self.title = title
    self.repeats = repeats
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title, "repeats": repeats]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTask", arguments: ["id": GraphQLVariable("id"), "title": GraphQLVariable("title"), "repeats": GraphQLVariable("repeats")], type: .object(UpdateTask.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTask: UpdateTask? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTask": updateTask.flatMap { $0.snapshot }])
    }

    public var updateTask: UpdateTask? {
      get {
        return (snapshot["updateTask"] as? Snapshot).flatMap { UpdateTask(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTask")
      }
    }

    public struct UpdateTask: GraphQLSelectionSet {
      public static let possibleTypes = ["Task"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("repeats", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, repeats: Int? = nil) {
        self.init(snapshot: ["__typename": "Task", "id": id, "title": title, "repeats": repeats])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var repeats: Int? {
        get {
          return snapshot["repeats"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "repeats")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var taskInformation: TaskInformation {
          get {
            return TaskInformation(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class AllTasksQuery: GraphQLQuery {
  public static let operationString =
    "query AllTasks {\n  allTasks {\n    __typename\n    ...TaskInformation\n  }\n}"

  public static var requestString: String { return operationString.appending(TaskInformation.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allTasks", type: .nonNull(.list(.nonNull(.object(AllTask.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allTasks: [AllTask]) {
      self.init(snapshot: ["__typename": "Query", "allTasks": allTasks.map { $0.snapshot }])
    }

    public var allTasks: [AllTask] {
      get {
        return (snapshot["allTasks"] as! [Snapshot]).map { AllTask(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "allTasks")
      }
    }

    public struct AllTask: GraphQLSelectionSet {
      public static let possibleTypes = ["Task"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("repeats", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, repeats: Int? = nil) {
        self.init(snapshot: ["__typename": "Task", "id": id, "title": title, "repeats": repeats])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var repeats: Int? {
        get {
          return snapshot["repeats"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "repeats")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var taskInformation: TaskInformation {
          get {
            return TaskInformation(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class TitleTaskQuery: GraphQLQuery {
  public static let operationString =
    "query TitleTask($title: String!) {\n  Task(title: $title) {\n    __typename\n    id\n    title\n    repeats\n  }\n}"

  public var title: String

  public init(title: String) {
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Task", arguments: ["title": GraphQLVariable("title")], type: .object(Task.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(task: Task? = nil) {
      self.init(snapshot: ["__typename": "Query", "Task": task.flatMap { $0.snapshot }])
    }

    public var task: Task? {
      get {
        return (snapshot["Task"] as? Snapshot).flatMap { Task(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "Task")
      }
    }

    public struct Task: GraphQLSelectionSet {
      public static let possibleTypes = ["Task"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("repeats", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String, repeats: Int? = nil) {
        self.init(snapshot: ["__typename": "Task", "id": id, "title": title, "repeats": repeats])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var repeats: Int? {
        get {
          return snapshot["repeats"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "repeats")
        }
      }
    }
  }
}

public struct TaskInformation: GraphQLFragment {
  public static let fragmentString =
    "fragment TaskInformation on Task {\n  __typename\n  id\n  title\n  repeats\n}"

  public static let possibleTypes = ["Task"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("repeats", type: .scalar(Int.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, title: String, repeats: Int? = nil) {
    self.init(snapshot: ["__typename": "Task", "id": id, "title": title, "repeats": repeats])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return snapshot["title"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "title")
    }
  }

  public var repeats: Int? {
    get {
      return snapshot["repeats"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "repeats")
    }
  }
}