//
//  HomeInteractor.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

class HomeInteractor: HomeInteractorDelegate {
    var presenter: HomeInteractorProtocol?
    var api = ApiRequests()
    
    func getPicturesByQuery(_ query: String, _ pages: Int) {
        let url = "https://api.unsplash.com/search/photos?page=\(pages)&query=\(query)"
        api.apiRequest(url, "GET") { [weak self] (data, error) in
            guard let data = data else {
                self?.presenter?.picturesRequestFailed(error!)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let findPictures = try decoder.decode(HomeEntity.self, from: data)
                self?.presenter?.picturesData(findPictures)
            }catch{
                self?.presenter?.picturesRequestFailed(error)
            }
        }
    }
}
