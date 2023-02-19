//
//  SectionsAdapter.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

/// Протокол для адаптации ячеек таблицы под менеджер задач.
protocol ISectionAdapter {
	/// Метод для подбора названия секции в таблице.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает название секции по номеру.
	func getSectionsTitles(section sectionIndex: Int) -> String
	
	/// Метод для подсчета количества строк в секции.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает количество строк в секции по номеру.
	func getSectionsNumberOfRows(section sectionIndex: Int) -> Int
	
	/// Метод для получения списка задач в секции.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает массив задач в секции в зависимости от номер секции.
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}

/// Класс для адаптации ячеек таблицы под список задач.
final class SectionAdapter: ISectionAdapter {
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Метод для подбора названия секции в таблице.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает название секции по номеру.
	func getSectionsTitles(section sectionIndex: Int) -> String {
		switch sectionIndex {
		case 1:
			return "Completed tasks"
		default:
			return "Not completed tasks"
		}
	}
	
	/// Метод для подсчета количества строк в секции.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает количество строк в секции по номеру.
	func getSectionsNumberOfRows(section sectionIndex: Int) -> Int {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasksSorted().count
		default:
			return taskManager.notCompletedTasksSorted().count
		}
	}
	
	/// Метод для получения списка задач в секции.
	/// - Parameter sectionIndex: Принимает номер секции.
	/// - Returns: Возвращает массив задач в секции в зависимости от номер секции.
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasksSorted()
		default:
			return taskManager.notCompletedTasksSorted()
		}
	}
}
