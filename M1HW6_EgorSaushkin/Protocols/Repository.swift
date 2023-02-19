//
//  Repository.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

/// Протокол для получения задач из репозитория
protocol ITaskRepository {
	/// Метод для получения задач из репозитория
	/// - Returns: Возвращает массив обычных и важных задач
	func getTasks() -> [Task]
}

/// Стаб-класс, который генерирует задачи
final class TaskRepositoryStub: ITaskRepository {
	
	/// Метод для получения задач из репозитория
	/// - Returns: Возвращает массив обычных и важных задач
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
