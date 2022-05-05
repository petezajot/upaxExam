//
//  LoaderViewController.swift
//  upax exam
//
//  Created by Sergio García Vargas on 05/05/22.
//

import UIKit

class LoaderViewController: UIViewController {
    @IBOutlet weak var loaderGif: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderGif.startAnimating()
    }
}
