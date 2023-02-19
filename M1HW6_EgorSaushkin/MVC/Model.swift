//
//  Model.swift
//  M1HW4_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 12.02.2023.
//

import UIKit

/// Базовый класс для разных типов задач
class Task {
	/// Название задачи
	var title: String
	/// Статус выполнения: выполнено или не выполнено
	var completed: Bool = false
	/// Картинка выполнения или не выполнения задачи
	let image = UIImage(systemName: "checkmark.circle.fill")
	
	init (title: String) {
		self.title = title
	}
}

/// Класс для обычных задач
final class RegularTask: Task {
}

/// Класс для приоритетных задач
final class ImportantTask: Task {
	
	/// Перечисление разных приоритетов задач
	enum TasksPriority: Int {
		case low = 0
		case medium = 1
		case high = 2
	}
	
	/// Установка приоритета задачи: низкий, средний или высокий
	var priority: TasksPriority
	
	/// Срок выполнения задачи в зависимости от приоритета
	var deadline: Date? {
		switch priority {
		case .low:
			return Calendar.current.date(byAdding: DateComponents(day: 3), to: Date())
		case .medium:
			return Calendar.current.date(byAdding: DateComponents(day: 2), to: Date())
		case .high:
			return Calendar.current.date(byAdding: DateComponents(day: 1), to: Date())
		}
	}
	
	init(title: String, priority: TasksPriority) {
		self.priority = priority
		super.init(title: title)
	}
}

extension ImportantTask: CustomStringConvertible {
	var description: String {
		"- [\(completed ? "x" : " ")] Important, priority: \(priority), title: \(title).\n"
	}
}

extension RegularTask: CustomStringConvertible {
	var description: String {
		"- [\(completed ? "x" : " ")] title: \(title).\n"
	}
}
