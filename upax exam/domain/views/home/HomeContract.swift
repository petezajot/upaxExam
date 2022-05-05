//
//  HomeProtocols.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewDelegate? { get set }
    var router: HomeRouterDelegate? { get set }
    var interactor: HomeInteractorDelegate? { get set }
    
    func getPicturesByQuery(_ query: String, _ page: Int)
    func showLoader()
    func hideLoader()
}

protocol HomeViewDelegate: AnyObject {
    func picturesData(_ homeEntity: HomeEntity?)
    func picturesRequestFailed(_ error: Error)
}

protocol HomeRouterDelegate: AnyObject {
    static func createModule() -> HomeViewController
    func showLoader()
    func hideLoader()
}

protocol HomeInteractorDelegate: AnyObject {
    var presenter: HomeInteractorProtocol? { get set }
    func getPicturesByQuery(_ query: String, _ pages: Int)
}

protocol HomeInteractorProtocol: AnyObject {
    func picturesData(_ homeEntity: HomeEntity?)
    func picturesRequestFailed(_ error: Error)
}
