//
//  ITaskManager.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 15.02.2023.
//

/// Протокол для менеджера задач.
protocol ITaskManager {
	/// Метод для отображения всех задач.
	/// - Returns: Возвращает массив задач.
	func allTasks() -> [Task]
	
	/// Метод для сортировки выполненных задач.
	/// - Returns: Возвращает массив выполненных задач отсортированных по приоритету.
	func completedTasksSorted() -> [Task]
	
	/// Метод для сортировки НЕ выполненных задач.
	/// - Returns: Возвращает массив НЕ выполненных задач отсортированных по приоритету.
	func notCompletedTasksSorted() -> [Task]
	
	/// Метод для добавления задач в список.
	/// - Parameter tasks: Содержит массив задач.
	func add(_ tasks: [Task])
	
	/// Метод удаляет задачи из списка.
	/// - Parameter task: Содержит задачу, которую необходимо удалить.
	func delete(_ task: Task)
	
	/// Метод для получения списка выполненных задач.
	/// - Returns: Возвращает массив выполненных задач.
	func completedList() -> [Task]
	
	/// Метод для получения списка НЕ выполненных задач.
	/// - Returns: Возвращает массив НЕ выполненных задач.
	func notCompletedList() -> [Task]
}
