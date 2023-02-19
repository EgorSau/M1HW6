//
//  Repository.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

protocol ITaskRepository {
	func getTasks() -> [Task]
}

final class TaskRepositoryStub: ITaskRepository {
	func getTasks() -> [Task] {
		[
			ImportantTask(title: "Task #1", priority: .high),
			RegularTask(title: "Task #2"),
			ImportantTask(title: "Task #3", priority: .low),
			RegularTask(title: "Task #4"),
			ImportantTask(title: "Task #5", priority: .medium)
		]
	}
}
