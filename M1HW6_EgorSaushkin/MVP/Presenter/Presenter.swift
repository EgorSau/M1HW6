//
//  Presenter.swift
//  M1HW5_EgorSaushkin
//
//  Created by Egor SAUSHKIN on 19.02.2023.
//

protocol IView {
	func render(viewData: ViewData)
}

class Presenter {
	let view: IView
	let model: ViewData
	
	required init(view: IView, model: ViewData) {
		self.view = view
		self.model = model
	}
	
	func presentView() {
		self.view.render(viewData: model)
	}	
}
