//
//  HomeViewController.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var uiTable: UITableView!
    var presenter: HomePresenterProtocol?
    var homeEntities = [Results]()
    var pages: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        uiTable.delegate = self
        uiTable.dataSource = self
    }
    
    fileprivate func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomHomeViewCell", bundle: nil)
        self.uiTable.register(textFieldCell, forCellReuseIdentifier: "CustomHomeViewCell")
    }
    
    fileprivate func setupTableData(_ homeEntity: HomeEntity?) {
        if pages == 1 {
            presenter?.hideLoader()
        }
        DispatchQueue.main.async {
            self.homeEntities.append(contentsOf: (homeEntity?.results as? [Results])!)
            self.uiTable.reloadData()
            self.loadImages()
        }
    }
    
    fileprivate func loadImages() {
        DispatchQueue.main.async {
            self.uiTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomHomeViewCell", for: indexPath) as? CustomHomeViewCell
        cell?.results = homeEntities[indexPath.row]
        return cell!
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        if pos > (uiTable.contentSize.height-100-scrollView.frame.size.height) {
            pages += 1
            getListFromServer(pages)
        }
    }
    
    @IBAction func findData(_ sender: Any) {
        presenter?.showLoader()
        pages = 1
        getListFromServer(pages)
    }
    
    fileprivate func getListFromServer(_ pageNumber: Int){
        if let query = searchBar.text {
            presenter?.getPicturesByQuery(query.lowercased(), pageNumber)
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func picturesData(_ homeEntity: HomeEntity?) {
        setupTableData(homeEntity)
    }
    
    func picturesRequestFailed(_ error: Error) {
        print("ERROR: \(error)")
    }
}
