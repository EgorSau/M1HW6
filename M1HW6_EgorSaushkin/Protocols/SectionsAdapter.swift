//
//  SectionsAdapter.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

protocol ISectionAdapter {
	func getSectionsTitles(section sectionIndex: Int) -> String
	func getSectionsNumberOfRows(section sectionIndex: Int) -> Int
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}

final class SectionAdapter: ISectionAdapter {
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	func getSectionsTitles(section sectionIndex: Int) -> String {
		switch sectionIndex {
		case 1:
			return "Completed tasks"
		default:
			return "Not completed tasks"
		}
	}
	
	func getSectionsNumberOfRows(section sectionIndex: Int) -> Int {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasksSorted().count
		default:
			return taskManager.notCompletedTasksSorted().count
		}
	}
	
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasksSorted()
		default:
			return taskManager.notCompletedTasksSorted()
		}
	}
}
