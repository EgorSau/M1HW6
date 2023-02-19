//
//  ITaskManager.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 15.02.2023.
//

protocol ITaskManager {
	func allTasks() -> [Task]
	func completedTasksSorted() -> [Task]
	func notCompletedTasksSorted() -> [Task]
	func add(_ tasks: [Task])
	func delete(_ task: Task)
	func completedList() -> [Task]
	func notCompletedList() -> [Task]
}
