//
//  HomeRouter.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterDelegate {
    static func createModule() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        let presenter: HomePresenterProtocol & HomeInteractorProtocol = HomePresenter()
        let interactor: HomeInteractorDelegate = HomeInteractor()
        let router: HomeRouterDelegate = HomeRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view!
    }
    
    func showLoader() {
        let loadingVC = LoaderRouter.createModule()
        loadingVC.modalTransitionStyle = .crossDissolve
        loadingVC.modalPresentationStyle = .overCurrentContext
        
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(loadingVC, animated: true)
        }
    }
    
    func hideLoader() {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.dismiss(animated: true)
        }
    }
}
