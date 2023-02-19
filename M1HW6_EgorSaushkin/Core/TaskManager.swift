//
//  TaskManager.swift
//  M1HW4_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 12.02.2023.
//

import UIKit

/// Класс для управления задачами
final class TaskManager {
	private var tasksList = [Task]()
	
	/// добавляет задачи в список
	private func addTask(_ task: Task) {
		tasksList.append(task)
	}
	/// удаляет задачи из списка
	private func deleteTask(_ task: Task) {
		tasksList.removeAll(where: {$0.title == task.title})
	}
	/// показывается все задачи
	private func showMeAllTasks() -> [Task] {
		tasksList
	}
	/// показывается все выполненные задачи
	private func showMeCompletedTasks() -> [Task] {
		var tasksCompleted = [Task]()
		tasksList.forEach({if $0.completed { tasksCompleted.append($0) }})
		return tasksCompleted
	}
	/// показывается все НЕ выполненные задачи
	private func showMeNotCompletedTasks() -> [Task] {
		var tasksNotCompleted = [Task]()
		tasksList.forEach({if $0.completed == false { tasksNotCompleted.append($0) }})
		return tasksNotCompleted
	}
}

extension TaskManager: ITaskManager {
	/// показывается все задачи
	func allTasks() -> [Task] {
		showMeAllTasks()
	}
	/// показывается выполненные задачи с сортировкой
	func completedTasksSorted() -> [Task] {
		completedList().sorted {
			if let task1 = $0 as? ImportantTask, let task2 = $1 as? ImportantTask {
				return task1.priority.rawValue > task2.priority.rawValue
			}
			return true
		}
	}
	/// показывается НЕ выполненные задачи с сортировкой
	func notCompletedTasksSorted() -> [Task] {
		notCompletedList().sorted {
			if let task1 = $0 as? ImportantTask, let task2 = $1 as? ImportantTask {
				return task1.priority.rawValue > task2.priority.rawValue
			}
			return true
		}
	}
	/// добавляет задачи в список
	func add(_ tasks: [Task]) {
		tasks.forEach({addTask($0)})
	}
	/// удаляет задачи из списка
	func delete(_ task: Task) {
		deleteTask(task)
	}
	/// показывается все выполненные задачи
	func completedList() -> [Task] {
		showMeCompletedTasks()
	}
	/// показывается все НЕ выполненные задачи
	func notCompletedList() -> [Task] {
		showMeNotCompletedTasks()
	}
}
