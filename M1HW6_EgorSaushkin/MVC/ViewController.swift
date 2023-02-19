//
//  ViewController.swift
//  M1HW4_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 12.02.2023.
//

import UIKit

/// Основной контроллер для отображения списка задач
class ViewController: UIViewController {
	
	private enum CellType: String {
		case important = "ImportantTableCell"
		case regular = "RegularTableCell"
	}
	
	private let padding: CGFloat = 16
	
	private let taskManager: ITaskManager
	private let repository: ITaskRepository
	private var adapter: ISectionAdapter!
	
	private lazy var tableView: UITableView = {
		let table = UITableView(frame: CGRect.zero, style: .grouped)
		table.delegate = self
		table.dataSource = self
		table.backgroundColor = .white
		table.register(ImportantTableCell.self, forCellReuseIdentifier: CellType.important.rawValue)
		table.register(RegularTableCell.self, forCellReuseIdentifier: CellType.regular.rawValue)
		table.translatesAutoresizingMaskIntoConstraints = false
		table.rowHeight = 40
		return table
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupConstraints()
	}
	
	init(repository: ITaskRepository, taskManager: ITaskManager) {
		self.repository = repository
		self.taskManager = taskManager
		taskManager.add(repository.getTasks())
		self.adapter = SectionAdapter(taskManager: taskManager)
		super.init(nibName: nil, bundle: .main)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func getTaskForIndex(_ indexPath: IndexPath) -> Task {
		adapter.getTasksForSection(section: indexPath.section)[indexPath.row]
	}
	
	private func setupConstraints() {
		view.backgroundColor = .white
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
		])
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int { 2 }
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		adapter.getSectionsTitles(section: section)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		adapter.getSectionsNumberOfRows(section: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let task = getTaskForIndex(indexPath)
		var cell = UITableViewCell()
		
		switch task {
		case is ImportantTask:
			guard let importantCell = tableView.dequeueReusableCell(withIdentifier: CellType.important.rawValue) as? ImportantTableCell else { return cell }
			cell = importantCell
			importantCell.setupCell(withViewModel: task)
		default:
			guard let regularCell = tableView.dequeueReusableCell(withIdentifier: CellType.regular.rawValue) as? RegularTableCell else { return cell }
			cell = regularCell
			regularCell.setupCell(withViewModel: task)
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let task = getTaskForIndex(indexPath)
		task.completed.toggle()
		tableView.reloadData()
	}
}
