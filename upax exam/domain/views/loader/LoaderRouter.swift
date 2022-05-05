//
//  LoaderRouter.swift
//  upax exam
//
//  Created by Sergio García Vargas on 05/05/22.
//

import Foundation
import UIKit

class LoaderRouter {
    static func createModule() -> LoaderViewController {
        let storyboard = UIStoryboard(name: "Loader", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "LoaderViewController") as? LoaderViewController
        return view!
    }
}
