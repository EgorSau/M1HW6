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
	
	private var adapter: ISectionAdapter!
	/// Презентор для модуля списка задач
	var presenter: Presenter!
	
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
		presenter.presentView()
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

extension ViewController: IView {
	/// Метод для загрузки данных из презентора во вью
	/// - Parameter viewData: Принимает модель данных для списка задач
	func render(viewData: ViewData) {
		viewData.taskManager.add(viewData.repository.getTasks())
		self.adapter = SectionAdapter(taskManager: viewData.taskManager)
	}
}
