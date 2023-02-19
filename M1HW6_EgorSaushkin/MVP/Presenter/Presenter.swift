//
//  Presenter.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

/// Протокол для отображения вью
protocol IView {
	/// Метод для загрузки данных из презентора во вью
	/// - Parameter viewData: Принимает модель данных для списка задач
	func render(viewData: ViewData)
}

/// Класс презентации, связки данных и вью
final class Presenter {
	private let view: IView
	private let model: ViewData
	
	required init(view: IView, model: ViewData) {
		self.view = view
		self.model = model
	}
	
	/// Метод презентации вью через презентор
	func presentView() {
		self.view.render(viewData: model)
	}	
}
