//
//  ImportantTableCell.swift
//  M1HW4_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 12.02.2023.
//

import UIKit

/// Ячейка для приоритетной задачи.
class ImportantTableCell: UITableViewCell {
	
	private var currentDate = Date()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	private lazy var taskLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 12)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var checkBox: UIImageView = {
		let checkBox = UIImageView()
		checkBox.layer.borderWidth = 2
		checkBox.layer.borderWidth = 1
		checkBox.layer.cornerRadius = 20
		checkBox.layer.borderColor = UIColor.black.cgColor
		checkBox.translatesAutoresizingMaskIntoConstraints = false
		return checkBox
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupConstraints() {
		addSubview(stack)
		stack.addArrangedSubview(taskLabel)
		stack.addArrangedSubview(checkBox)
		
		NSLayoutConstraint.activate([
			stack.topAnchor.constraint(equalTo: topAnchor),
			stack.leadingAnchor.constraint(equalTo: leadingAnchor),
			stack.trailingAnchor.constraint(equalTo: trailingAnchor),
			stack.bottomAnchor.constraint(equalTo: bottomAnchor),
			checkBox.widthAnchor.constraint(equalToConstant: 40),
		])
	}
	
	/// Настраивает ячейку для важной задачи.
	func setupCell(withViewModel viewModel: Task) {
		guard let model = viewModel as? ImportantTask else { return }
		guard let date = model.deadline?.formatted() else { return }
		taskLabel.text = "\(String(describing: model.title)), priority: \(String(describing: model.priority))\nDeadline: \(String(describing: date))"
		if model.completed {
			checkBox.image = model.image
		} else {
			checkBox.image = nil
		}
		guard let deadline = model.deadline else { return }
		if deadline < currentDate {
			taskLabel.textColor = .systemPink
		}
	}
}
