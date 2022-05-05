//
//  HomePresenter.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewDelegate?
    var router: HomeRouterDelegate?
    var interactor: HomeInteractorDelegate?
    
    func getPicturesByQuery(_ query: String, _ page: Int) {
        interactor?.getPicturesByQuery(query, page)
    }
    
    func showLoader() {
        router?.showLoader()
    }
    
    func hideLoader() {
        router?.hideLoader()
    }
}

extension HomePresenter: HomeInteractorProtocol {
    func picturesData(_ homeEntity: HomeEntity?) {
        view?.picturesData(homeEntity)
    }
    
    func picturesRequestFailed(_ error: Error) {
        view?.picturesRequestFailed(error)
    }
}
